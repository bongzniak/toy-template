//
//  Networking.swift
//  mydano
//
//  Created by Fernando on 2021/05/24.
//  Copyright © 2021 dano. All rights reserved.
//

import Moya
import MoyaSugar
import Alamofire
import RxSwift

public protocol NetworkingProtocol {
    func request(
        _ target: SugarTargetType,
        file: String,
        function: StaticString,
        line: UInt
    ) -> Single<Response>
}

public extension NetworkingProtocol {
    func request(
        _ target: SugarTargetType,
        file: String = #file,
        function: StaticString = #function,
        line: UInt = #line
    ) -> Single<Response> {
        request(target, file: file, function: function, line: line)
    }
}

final class Networking<Target: SugarTargetType>:
    MoyaSugarProvider<Target>,
    NetworkingProtocol {

    init(plugins: [PluginType]? = nil, isAppendTokenPlugin: Bool = true) {
        var finalPlugins: [PluginType] = plugins ?? [PluginType]()
        finalPlugins.append(NetworkActivityPlugin(networkActivityClosure: { (change, _) in
            DispatchQueue.main.async {
                switch change {
                case .began:
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                case .ended:
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }))
        finalPlugins.append(LoggingPlugin())

        if isAppendTokenPlugin {
            finalPlugins.append(TokenPlugin())
        }
        super.init(plugins: finalPlugins)
    }

    func request(
        _ target: Target,
        file: StaticString = #file,
        function: StaticString = #function,
        line: UInt = #line
    ) -> Single<Response> {
        let method = "\(target.method)"
        let requestString = "[\(method)] \(target.path)"
        logger.verbose(target.defaultURL)

        return self.rx.request(target)
            .filterSuccessfulStatusCodes()
            .do(
                onSuccess: { value in
                    let message = "\(requestString) (\(value.statusCode))"
                    logger.debug(message)
                },
                onError: { error in
                    if let response = (error as? MoyaError)?.response {
                        if let jsonObject = try? response.mapJSON(failsOnEmptyData: false) {
                            let message =
                                """
                                FAILURE: \(requestString) (\(response.statusCode))
                                \(jsonObject)
                                """
                            logger.error(message, file: file, function: function, line: line)
                        } else if let rawString = String(data: response.data, encoding: .utf8) {
                            let message =
                                """
                                FAILURE: \(requestString) (\(response.statusCode))
                                \(rawString)
                                """
                            logger.error(message, file: file, function: function, line: line)
                        } else {
                            let message =
                                """
                                FAILURE: \(requestString) (\(response.statusCode))
                                """
                            logger.error(message, file: file, function: function, line: line)
                        }
                    } else {
                        let message =
                            """
                            FAILURE: \(requestString)
                            \(error)
                            """
                        logger.error(message, file: file, function: function, line: line)
                    }
                },
                onSubscribed: {
                    let message = """
                                  REQUEST: \(requestString)
                                  """
                    logger.debug(message, file: file, function: function, line: line)
                }
            )
            .retryWhen { error in
                Self.retryWhenTrigger(with: error)
            }
    }

    private static func retryWhenTrigger(with error: Observable<Error>) -> Observable<Void> {
        let maxAttemptCount = 3

        return error.enumerated()
            .flatMap { index, error -> Observable<Void> in
//                guard Self.isSoftwareCausedConnectionAbortError(error) else {
//                    logger.error("Networking: isSoftwareCausedConnectionAbortError")
//                    return .error(error)
//                }

                let currentAttemptCount = index + 1
                if currentAttemptCount < maxAttemptCount {
                    return .just(Void())
                        .delay(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
                } else {
                    return .error(error)
                }
            }
    }

    /**
     iOS 12에서 UIApplication이 willEnterForeground 상태일 때 네트워크 요청을 보내면 발생하는 에러인 경우 `true`를 반환합니다.
     ```
     Error Domain=NSPOSIXErrorDomain Code=53 "Software caused connection abort"
     ```
     */
    private static func isSoftwareCausedConnectionAbortError(_ error: Error) -> Bool {
        if case let MoyaError.underlying(underlyingError, _) = error {
            return self.isSoftwareCausedConnectionAbortError(underlyingError)
        }
        let nsError = error as NSError
        return (nsError.domain, nsError.code) == (NSPOSIXErrorDomain, 53)
    }
}

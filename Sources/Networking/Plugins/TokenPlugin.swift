// 
// TokenPlugin.swift
// dano
// 
// Created by 조봉기 on 2021/07/14.
// Copyright 2021 dano. All rights reserved.
//

import Moya

struct TokenPlugin: PluginType {
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case let .success(response):
            let request = response.request
            let url = request?.url?.absoluteString ?? "nil"
            let method = request?.httpMethod ?? "nil"
            let statusCode = response.statusCode

            if statusCode == 401 {
                logger.error("TokenPlugin: expired token try refresh")
            }

        case let .failure(error):
            logger.error(error)
        }
    }
}


// 
// Array+Extension.swift
// tmsae
// 
// Created by bongzniak on 2022/06/15.
// Copyright 2022 tmsae. All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        indices ~= index ? self[index] : nil
    }

    subscript(safe range: Range<Index>) -> ArraySlice<Element> {
        if range.endIndex > endIndex {
            return range.startIndex >= endIndex
                ? []
                : self[range.startIndex..<endIndex]
        }
        else {
            return self[range]
        }
    }

    mutating func remove(elementsAtIndices indicesToRemove: [Int]) -> [Element] {
        let removedElements = indicesToRemove.map { self[$0] }
        for indexToRemove in indicesToRemove.sorted(by: >) {
            remove(at: indexToRemove)
        }
        return removedElements
    }
}
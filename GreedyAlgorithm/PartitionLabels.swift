//
//  PartitionLabels.swift
//  GreedyAlgorithm
//
//  Created by Jamie Chen on 2021-08-27.
//

import Foundation

func partitionLabels(_ s: String) -> [Int] {
    guard !s.isEmpty else { return [] }
    
    var result: [Int] = []
    var dictionary: [Character: Int] = [:]
    for (index, char) in s.enumerated() {
        dictionary[char, default: 0] = index
    }
    var start = 0
    var last = 0
    
    for i in 0..<s.count {
        let index = s.index(s.startIndex, offsetBy: i)
        last = max(dictionary[s[index]] ?? 0, last)
        
        if i == last {
            result.append(last - start + 1)
            start = i + 1
        }
    }
    
    return result
}

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
    //
    for (index, char) in s.enumerated() {
        dictionary[char, default: 0] = index
    }
    // starting positon
    var start = 0
    // end position of the character
    var last = 0
    
    for i in 0..<s.count {
        // first get the index of the first character
        let index = s.index(s.startIndex, offsetBy: i)
        // find the last place of the character
        last = max(dictionary[s[index]] ?? 0, last)
        // if we reach to the last index of the character
        if i == last {
            // append the number of the characters length to the array.
            // ie. a's last index is 8 and b and c's last index is before the 8
            // so 8 - 0(start position) + 1 is 9
            result.append(last - start + 1)
            // start will change to current i + 1
            start = i + 1
        }
    }
    
    return result
}

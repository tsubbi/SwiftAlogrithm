//
//  CyclicPermutaion.swift
//  CyclicPermutation
//
//  Created by Jamie Chen on 2021-08-23.
//

import Foundation

func cyclicPermutation() {
    let numberOfCases = Int(readLine()!)!
    for i in 1...numberOfCases{
        print("\nCase #\(i):", terminator: "")
        let numberOfElements = Int(readLine()!)!
        let secondLine = readLine()!
        var notation = secondLine.components(separatedBy: " ")
            .enumerated().reduce([:]) { (result, value) -> Dictionary<Int, (Int, Bool)> in
                var dic = result
                dic[value.offset+1] = (Int(value.element)!, false)
                return dic
            }
        
        var numberOfCount = 0
        
        for i in 1...numberOfElements {
            guard !notation[i]!.1 else { continue }
            // check if the number is at it's own circle
            if i == notation[i]?.0 {
                numberOfCount += 1
                notation[i]?.1 = true
                continue
            }
            
            var node = i
            repeat {
                notation[node]!.1 = true
                if notation[node]?.0 != i {
                    node = notation[node]!.0
                } else {
                    numberOfCount += 1
                    break
                }
            } while node != i
        }
                
        print(numberOfCount)
    }
}

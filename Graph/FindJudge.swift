//
//  FindJudge.swift
//  Graph
//
//  Created by Jamie Chen on 2021-08-23.
//

import Foundation

func findJudge(_ n: Int, _ trusts: [[Int]]) -> Int {
    var townFolks: [Int: [Int]] = [:]
    var judge = -1
    
    // set table from 1 to n
    for i in 1...n {
        townFolks[i] = []
    }
    // map trusts to table
    for trust in trusts {
        townFolks[trust[0]]!.append(trust[1])
    }
    
    for folk in townFolks {
        if folk.value.count == 0 {
            judge = folk.key
        }
    }
    
    // extra check if the existing judge is correct
    townFolks.keys.forEach {
        if $0 != judge, townFolks[$0]!.contains(judge) {
            judge = -1
        }
    }
    
    return judge
}

//
//  TaskScheduler.swift
//  GreedyAlgorithm
//
//  Created by Jamie Chen on 2021-08-27.
//

import Foundation

func leastIntervval(_ tasks: [Character], _ n: Int) -> Int {
    guard tasks.count > 0 else { return 0 }
    
    var dict: [Character: Int] = [:]
    for task in tasks {
        dict[task, default: 0] += 1
    }

    guard let maxValue = dict.values
            .map({ Int($0) })
            .max()
    else {
        return 0
    }
    
    let numberOfMax = dict.values.filter {
        $0 == maxValue
    }.count
    
    return max(tasks.count, (maxValue-1)*(n+1)+numberOfMax)
}

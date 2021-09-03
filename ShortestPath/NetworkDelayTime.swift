//
//  NetworkDelayTime.swift
//  ShortestPath
//
//  Created by Jamie Chen on 2021-09-02.
//

import Foundation

// n is total number of node
// k is starting node
// times is a list of [from, to, cost]
// return total cost
func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
    guard  times.count > 0 else { return -1 }
    
    var visited = Array(repeating: false, count: n)
    visited[k-1] = true
    var map: [Int: [(to: Int, w: Int)]]
    for time in times {
        map[time[0], default: []].append((to: time[1], w: time[2]))
    }
    var minCost = Int.max
    var queue: [(to: Int, totalCost: Int)] = []
    for route in map[k]! {
        queue.append((to: route.to, totalCost: route.w))
    }

    
    while !queue.isEmpty {
        let (to, cost) = queue.removeFirst()
        
        
    }
    

}

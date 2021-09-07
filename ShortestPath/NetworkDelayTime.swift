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
    var result = 0
    var edges: [Int: [(to: Int, distance: Int)]] = [:]
    // to use n+1 to fit for the node number
    var distances = Array<Int>(repeating: Int.max, count: n+1)
    var queue = [k]
    // starting node's distance is 0
    distances[k] = 0
    
    for edge in times {
        edges[edge[0], default: []].append((edge[1], edge[2]))
    }
    
    while !queue.isEmpty {
        let start = queue.removeFirst()
        var visited: Set<Int> = []
        for (to, weight) in edges[start, default: []] {
            if distances[start] != Int.max &&
                distances[start] + weight < distances[to] {
                // add the current distance with the distance to next node
                distances[to] = distances[start] + weight
                // if we visited the node, skip
                if visited.contains(to) { continue }
                visited.insert(to)
                queue.append(to)
            }
        }
    }
    
    for i in 1...n {
        // find the max number of the distance
        result = max(result, distances[i])
    }
    
    return result == Int.max ? -1 : result
}

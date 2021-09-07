//
//  PathToMaximumProbability.swift
//  ShortestPath
//
//  Created by Jamie Chen on 2021-09-07.
//

import Foundation

// n => number of nodes
// edges => connections[from, to]
// succProb => weight of each edge
// start => starging node
// end => dest node
func maxProbability(_ n: Int, _ edges:[[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
    
    var graph: [Int: [(to: Int, weight: Double)]] = [:]
    for (index, edge) in edges.enumerated() {
        // bidirectional
        graph[edge[0], default: []].append((to: edge[1], weight: succProb[index]))
        graph[edge[1], default: []].append((to: edge[0], weight: succProb[index]))
    }
    
    var queue = [start]
    var dist = Array<Double>.init(repeating: 0, count: n+1)
    dist[start] = 1.0
    
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        
        for (to, weight) in graph[currentNode, default: []] {
            // if current weight times the weight to next node is still greater than the weight to next node, search again 
            if dist[currentNode] * weight > dist[to] {
                queue.append(to)
                dist[to] = dist[currentNode] * weight
            }
        }
        
    }
    
    return dist[end]
}

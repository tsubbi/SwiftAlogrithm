//
//  FindCenter.swift
//  Graph
//
//  Created by Jamie Chen on 2021-08-23.
//

import Foundation

func findCenter(_ edges: [[Int]]) -> Int {
    var connections: [Int: [Int]] = [:]
    
    for edge in edges {
        connections[edge[0]]!.append(edge[1])
    }
    
    var center = 0
    var maxConnection = 0
    for connection in connections {
        if connection.value.count > maxConnection {
            center = connection.key
            maxConnection = connection.value.count
        }
    }
    
    return center
}

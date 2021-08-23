//
//  NumberOfProvinces.swift
//  Graph
//
//  Created by Jamie Chen on 2021-08-23.
//

import Foundation

func findCircleNum(_ isConnected: [[Int]]) -> Int {
    func dfs(start: Int, adjList: [[Int]], visited: inout [Bool]) {
        visited[start] = true
        for visit in adjList[start] {
            if !visited[visit] {
                dfs(start: visit, adjList: adjList, visited: &visited)
            }
        }
    }
    
    guard isConnected.count > 0, isConnected[0].count > 0 else { return 0 }
    
    var visited: [Bool] = Array(repeating: false, count: isConnected.count)
    var cnt = 0
    
    for i in 0..<isConnected.count {
        if !visited[i] {
            dfs(start: i, adjList: isConnected, visited: &visited)
            cnt += 1
        }
    }
    
    return cnt
}

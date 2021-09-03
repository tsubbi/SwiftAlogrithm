//
//  PathWithMinimumEffort.swift
//  ShortestPath
//
//  Created by Jamie Chen on 2021-09-03.
//

import Foundation

// https://www.youtube.com/watch?v=FabSLaGu0NI
func minimumEffortPath(_ heights: [[Int]]) -> Int {
    let col = heights.count
    let row = heights[0].count
    
    var efforts = Array(repeating: Array(repeating: Int.max, count: row), count: col)
    efforts[0][0] = 0
    var visited = Array(repeating: Array(repeating: false, count: row), count: col)
    visited[0][0] = true
    var queue = [(0, 0)]
    
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        let initialValue = heights[y][x]
        
        // if can move up
        if y+1 < col, !visited[y+1][x] {
            let a = abs(heights[y+1][x] - initialValue)
            efforts[y+1][x] = min(a, initialValue)
            visited[y+1][x] = true
            queue.append((x, y+1))
        }
        
        // if can move down
        if y-1 > -1, !visited[y-1][x] {
            let a = abs(heights[y-1][x] - initialValue)
            efforts[y-1][x] = min(a, initialValue)
            visited[y-1][x] = true
            queue.append((x, y-1))
        }
        
        // if can move right
        if x+1 < row, !visited[y][x+1] {
            let a = abs(heights[y][x+1] - initialValue)
            efforts[y][x+1] = min(a, initialValue)
            visited[y][x+1] = true
            queue.append((y, x+1))
        }
        
        // if can move left
        if x-1 > -1, !visited[y][x-1] {
            let a = abs(heights[y][x-1] - initialValue)
            efforts[y][x-1] = min(a, initialValue)
            visited[y][x-1] = true
            queue.append((y, x-1))
        }
    }
    
    return efforts[col-1][row-1]
}

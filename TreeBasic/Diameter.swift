//
//  Diameter.swift
//  TreeBasic
//
//  Created by Jamie Chen on 2021-08-25.
//

import Foundation

func diameter() {
    
    struct Node {
        let currentNode: Int
        let distance: Int
        var visited: Bool
    }
    
    var nodeList: [Int: [Node]] = [:]
    let n = Int(readLine()!)!
    var cnt = 0
    
    repeat {
        let line = readLine()!.split(separator: " ").map {
            return Int($0) ?? -100
        }
        let currentNode = line.first!
        nodeList[currentNode] = []
        
        for i in stride(from: 1, to: line.count, by: 2) {
            guard line[i] > -1 else { continue }
            let nextNodeValue = line[i+1]
            let distance = line[i+2]
            let newNode = Node(currentNode: nextNodeValue, distance: distance, visited: false)
            nodeList[currentNode]?.append(newNode)
        }
        cnt += 1
    } while cnt < n
    
    
}

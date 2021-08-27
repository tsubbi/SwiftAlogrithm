//
//  Diameter.swift
//  TreeBasic
//
//  Created by Jamie Chen on 2021-08-25.
//

import Foundation

func diameter {
    struct Node {
        let currentNode: Node
        let nextNode: Node?
        let distance: Int
        var visited: Bool
    }
    
    let n = Int(readLine()!)!
    for _ in 1...n {
        let line = readLine()!.split(separator: " ").map({ Int($0)! })
    }
}



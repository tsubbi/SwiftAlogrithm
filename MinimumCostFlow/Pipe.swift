//
//  Pipe.swift
//  MinimumCostFlow
//
//  Created by Jamie Chen on 2021-08-31.
//

import Foundation

struct Pipe {
    var current: Int
    var next: Int
    var distance: Int
    var isActive: Bool
}

extension Pipe: Comparable {
    static func < (lhs: Pipe, rhs: Pipe) -> Bool {
        return lhs.distance < rhs.distance
    }
}

// https://www.youtube.com/watch?v=JZBQLXgSGfs
struct UnionFind {
    private var size: [Int]
    private var id: [Int]
    
    init(size: Int) {
        self.size = Array(repeating: 0, count: size)
        self.id = Array(0..<size)
    }
    
    mutating func findRoot(_ x: Int) -> Int {
        var index = x
        while index != size[index] {
            self.size[index] = size[size[index]]
            index = self.size[x]
        }
        return index
    }
    
    mutating func isSameRoot(lhs: Int, rhs: Int) -> Bool {
        return self.findRoot(lhs) == self.findRoot(rhs)
    }
    
    mutating func union(group node1: Int, to node2: Int) {
        let mainNode = self.findRoot(node1)
        let mergingNode = self.findRoot(node2)
        
        guard mainNode != mergingNode else { return }
        
        if size[mainNode] < size[mergingNode] {
            id[mainNode] = mergingNode
            size[mergingNode] += size[mainNode]
        } else {
            id[mergingNode] = mainNode
            size[mainNode] += size[mergingNode]
        }
    }
}

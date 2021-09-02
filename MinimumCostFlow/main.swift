//
//  main.swift
//  MinimumCostFlow
//
//  Created by Jamie Chen on 2021-08-31.
//

import Foundation

print("Hello, World!")

func read() -> (totalBuildings: Int, totalPipes: Int, enhensor: Int, pipes: [Pipe]) {
    let line = readLine()!.split(separator: " ")
    let totalBuildings = Int(line[0])!
    let totalPipes = Int(line[1])!
    let enhensor = Int(line[2])!
    var pipes: [Pipe] = []
    
    for i in 1...totalPipes {
        let pipePlan = readLine()!.split(separator: " ")
        let connectTo = Int(pipePlan[1])!
        let distance = Int(pipePlan[2])!
        
        pipes.append(Pipe(current: i, next: connectTo, distance: distance, isActive: i < totalBuildings-1))
    }
    
    return (totalBuildings, totalPipes, enhensor, pipes)
}

func solve() {
    let plans = read()
    let sortedPipes = plans.pipes.sorted(by: <)
    var days = 0
    var unifind = UnionFind(size: plans.totalBuildings)
    
    for pipe in sortedPipes {
        if !unifind.isSameRoot(lhs: pipe.current, rhs: pipe.next) {
            unifind.union(group: pipe.current, to: pipe.next)
            
            if !pipe.isActive {
                days += 1
            }
        }
    }
    
    print(days)
}

//
//  main.swift
//  MinimumCostFlow
//
//  Created by Jamie Chen on 2021-08-31.
//

import Foundation

print("Hello, World!")

var pipes: [Pipe] = []

func read() -> (totalBuildings: Int, totalPipes: Int, totalDistance: Int, pipes: [Pipe]) {
    let line = readLine()!.split(separator: " ")
    let totalBuildings = Int(line[0])!
    let totalPipes = Int(line[1])!
    let d = Int(line[2])!
    var pipes: [Pipe] = []
    
    for i in 1...totalBuildings {
        let pipePlan = readLine()!.split(separator: " ")
        let connectTo = Int(pipePlan[1])!
        let distance = Int(pipePlan[2])!
        
        pipes.append(Pipe(current: i, next: connectTo, distance: distance, isActive: i < totalPipes))
    }
    
    return (totalBuildings, totalPipes, d, pipes)
}

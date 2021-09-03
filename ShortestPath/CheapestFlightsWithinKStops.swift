//
//  CheapestFlightsWithinKStops.swift
//  ShortestPath
//
//  Created by Jamie Chen on 2021-09-03.
//

import Foundation
// n => number of stops
// flights => [from, to, price]
// src => starting city
// dst => destination
// k => number of flights to be allowed
// return price
func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
    var map: [Int: [(to: Int, cost: Int)]] = [:]
    // map the flights
    for flight in flights {
        map[flight[0], default: []].append((flight[1], flight[2]))
    }
    // I can't use negative number because later comparison will have conflict
    var minCost = Int.max
    var queue: [(start: Int, maxStops: Int, totalCost: Int)] = []
    // appending starting city with max stops(k+1) and total cost
    queue.append((src, k+1, 0))
    
    while !queue.isEmpty {
        let (start, maxStops, totalCost) = queue.removeFirst()
        
        // if start is same as destination, we find the lowest number
        // if maxstops hits to 0 or total amount is greater tha minCost, we continue search if there is possible answer and the queue will not be updated
        if start == dst || maxStops == 0 || totalCost > minCost {
            if start == dst {
                minCost = min(minCost, totalCost)
            }
            continue
        }
        
        // we append the possible cost through starting point
        // in the question, there are 2 possible flights to reach destination, however, we only can have 1 flight, so the lowest cost will not suit for the requirement
        // if there is possible answer, we update to queue
        for (next, cost) in map[start] ?? [] {
            queue.append((next, maxStops-1, totalCost+cost))
        }
    }
    
    return minCost != Int.max ? minCost : -1
}

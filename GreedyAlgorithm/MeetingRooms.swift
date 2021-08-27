//
//  MeetingRooms.swift
//  GreedyAlgorithm
//
//  Created by Jamie Chen on 2021-08-27.
//

import Foundation

func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    guard  intervals.count > 1 else {
        return true
    }
    let sortedIntervals = intervals.sorted {
        if $0[0] != $1[0] {
            return $0[0] < $1[0]
        } else {
            return $0[1] < $1[1]
        }
    }
    
    for i in 0..<sortedIntervals.count-1 {
        if sortedIntervals[i].last! > sortedIntervals[i+1].first! {
            return false
        }
    }
    
    return true
}

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
    // sort the starting time
    let sortedIntervals = intervals.sorted {
        return $0[0] < $1[0]
    }
    // if the first meeting's end time > second meeting's end time return false
    for i in 0..<sortedIntervals.count-1 {
        if sortedIntervals[i].last! > sortedIntervals[i+1].first! {
            return false
        }
    }
    
    return true
}

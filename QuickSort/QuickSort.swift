//
//  QuickSort.swift
//  QuickSort
//
//  Created by Jamie Chen on 2021-08-04.
//

import Foundation

// * Quick Sort (Does not sort in-place)
// Space Complexity: O(n) -> Your implementation should be O(1) (which means you're not supposed to create new arrays)
func quickSortSlow<T: Comparable>(_ arr: [T]) -> [T] {
  if arr.count <= 1 { return arr }
  var elements = arr
  let pivot = elements.removeLast()
  let lessOrEqual = elements.filter { $0 <= pivot }
  let greater = elements.filter { $0 > pivot }
  return quickSortSlow(lessOrEqual) + [pivot] + quickSortSlow(greater)
}

// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
    if start < end {
        // there is bug in there that I haven't yet find the bug
        let partitionIndex = partition(&arr, start, end)
        quickSort(&arr, start, partitionIndex-1)
        quickSort(&arr, partitionIndex+1, end)
    }
    
    print(arr)
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
    let pivot = arr[end]
    var partitionIndex = start
    
    // start...i is all the value is <= pivot
    // partition+1 ... i-1 is all values > pivot
    // i ... end-1 are values hasn't checked yet
    // arr[end] is the reference point
    for i in start...end {
        if arr[i] <= pivot {
            // swap the values
            (arr[partitionIndex], arr[i]) = (arr[i], arr[partitionIndex])
            partitionIndex += 1
        }
    }
    // swap the pivot with last because it is equal or less than the last
    (arr[partitionIndex], arr[end]) = (arr[end], arr[partitionIndex])
    print("end find partition index")
    return partitionIndex
}

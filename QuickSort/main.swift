//
//  main.swift
//  QuickSort
//
//  Created by Jamie Chen on 2021-08-04.
//

import Foundation

print("Hello, World!")

var dataSet = [2, 5, 1, 19, 12, 6, 3, 8, 4, 9, 7, 10]
quickSort(&dataSet, 0, dataSet.count-1)
print(dataSet)

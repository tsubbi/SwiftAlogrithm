//
//  main.swift
//  Assignment1-Evaluation
//
//  Created by Jamie Chen on 2021-07-28.
//

import Foundation

print("Hello, World!")

func evaluation(_ eval: String) -> Int {
    // base case
    if eval.count == 1 {
        return Int(eval)!
    }
    
    // recursion case
    // https://stackoverflow.com/a/29089803
    let mathExpression = NSExpression(format: eval)
    let value = mathExpression.expressionValue(with: nil, context: nil) as! Int
    return value
}

print(evaluation("((1+2)*3)"))

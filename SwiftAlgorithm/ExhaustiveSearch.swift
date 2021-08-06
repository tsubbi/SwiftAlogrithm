//
//  ExhaustiveSearch.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2021-07-28.
//

import Foundation

/// Print all binary number representation with n digits O(2^n)
/// - Parameter n: the number of digits
func printBinary(_ n: Int) {
  printBinaryHelper(n)
}

func printBinaryHelper(_ n: Int, _ soFar: String = "") {
  if n == 0 {
    // we have no more digits left to choose
    print(soFar)
  } else {
    // we have more decisions to make
    // for each available choice (0, 1)
    for i in 0...1 {
      let choice = i // choose one
      printBinaryHelper(n - 1, soFar + "\(choice)") // search the remaining
    }
//    printBinaryHelper(n - 1, soFar + "0") // search the remaining
//    printBinaryHelper(n - 1, soFar + "1") // search the remaining
  }
}

/// Print all decimal number representation with n digits O(10^n)
/// - Parameter n: the number of digits
func printDecimal(_ n: Int) {
  printDecimalHelper(n)
}

func printDecimalHelper(_ n: Int, _ soFar: String = "") {
  if n == 0 {
    // we have no more digits left to choose
    print(soFar)
  } else {
    // we have more decisions to make
    // for each available choice (0, 1, 2, ..., 9)
    for i in 0...9 {
      printDecimalHelper(n - 1, soFar + "\(i)") // search the remaining
    }
  }
}

/// Write a recursive function permutation that accepts a string as a parameter
/// and outputs all possible rearrangements of the letters in the string.
/// - Parameter word: the string
func permutation(_ word: String) {
  permutationHelper(word)
}

func permutationHelper(_ word: String, _ soFar: String = "") {
  if word.count == 0 {
    print(soFar)
  } else {
    // for all available choices
    for i in 0..<word.count {
      let c = word[i] // choose one
      permutationHelper(word[0, i] + word[i + 1, word.count], soFar + c)
    }
  }
}

func permutationUnique(_ word: String, _ soFar: String = "", _ set: inout Set<String>) {
  if word.count == 0 {
    set.insert(soFar)
  } else {
    // for all available choices
    for i in 0..<word.count {
      let c = word[i] // choose one
      permutationUnique(word[0, i] + word[i + 1, word.count], soFar + c, &set)
    }
  }
}

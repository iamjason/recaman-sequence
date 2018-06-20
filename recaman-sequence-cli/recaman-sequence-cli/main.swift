//
//  main.swift
//  recaman-sequence-cli
//
//  Created by Jason Garrett on 6/20/18.
//  Copyright © 2018 Jason Garrett. All rights reserved.
//

import Foundation

/*:
 # Recamán Sequence
 ## https://oeis.org/A005132
 ### Method:
 Create a set with one element (0). Starting with (a, n) as (0, 1), add n to a if a is less than n or (a - n) is already in the set. If not, subtract n from a. Add the current value of a to the set, and increment n by 1. Repeat until n is greater than x (the nth digit of the sequence), then return the value of a.
 
 */
struct RacamanSequence {
  
  typealias Result = (a:Int, sequence:[Int])
  
  static func generate(iterations x:Int = 10) -> Result {
    
    var seq = [0]
    var a = 0
    var n = 1
    
    while n <= x {
      
      if a < n || seq.contains(a - n) {
        a += n
      } else {
        a -= n
      }
      seq.append(a)
      n += 1
      
    }
    
    return (a, seq)
  }
  
}

let myVersion = RacamanSequence.generate(iterations: 70)
print("recaman sequence: \(myVersion)")

let approved = [0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11, 22, 10, 23, 9, 24, 8, 25, 43, 62, 42, 63, 41, 18, 42, 17, 43, 16, 44, 15, 45, 14, 46, 79, 113, 78, 114, 77, 39, 78, 38, 79, 37, 80, 36, 81, 35, 82, 34, 83, 33, 84, 32, 85, 31, 86, 30, 87, 29, 88, 28, 89, 27, 90, 26, 91, 157, 224, 156, 225, 155]
print("do they match?  \(approved == myVersion.sequence)")

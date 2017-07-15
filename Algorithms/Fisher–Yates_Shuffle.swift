//
//  Fisher–Yates_Shuffle.swift
//  Algorithms and Data Structures
//
//  Created by Vyacheslav Khorkov on 15/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation
import Darwin

func shuffle(_ array: inout [Int]) {
	for i in 0..<(array.count - 1) {
		let bottom = UInt32(i + 1)
		let top = UInt32(array.count - 1 - i)
		let randomIndex = Int(arc4random_uniform(top) + bottom)
		swap(&array[randomIndex], &array[i])
	}
}

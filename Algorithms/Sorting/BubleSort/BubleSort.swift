//
//  BubleSort.swift
//  Algorithms and Data Structures
//
//  Created by Vyacheslav Khorkov on 13/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

func bubleSort<T: Comparable>(_ a: inout [T]) {
	for i in a.indices {
		var changed = false
		for j in 0..<(a.count - 1 - i) {
			if a[j] > a[j + 1] {
				swap(&a[j], &a[j + 1])
				changed = true
			}
		}
		if !changed { break }
	}
}

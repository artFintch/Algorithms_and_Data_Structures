//
//  InsertionSort.swift
//  Algorithms and Data Structures
//
//  Created by Vyacheslav Khorkov on 15/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

func insertionSort<T: Comparable>(_ a: inout [T]) {
	for i in a.indices.dropFirst() {
		let cur = a[i]
		var j = i - 1
		while j >= 0 && cur < a[j] {
			a[j + 1] = a[j]
			j -= 1
		}
		a[j + 1] = cur
	}
}

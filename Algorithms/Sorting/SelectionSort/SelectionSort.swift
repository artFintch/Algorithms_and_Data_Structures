//
//  SelectionSort.swift
//  Algorithms and Data Structures
//
//  Created by Vyacheslav Khorkov on 13/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

func selectionSort<T: Comparable>(_ a: inout [T]) {
	for i in a.indices {
		var k = i
		for j in i..<a.count {
			if a[j] < a[k] {
				k = j
			}
		}
		if k != i {
			swap(&a[k], &a[i])
		}
	}
}

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
		var m = i
		
		for j in i..<a.count {
			if a[j] < a[m] {
				m = j
			}
		}
		
		if m != i {
			swap(&a[m], &a[i])
		}
	}
}

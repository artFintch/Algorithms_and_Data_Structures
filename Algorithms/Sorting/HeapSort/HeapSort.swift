//
//  HeapSort.swift
//  HeapSort
//
//  Created by Vyacheslav Khorkov on 25/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

// Heap sort.
// Complexity: O(n * log n)
// Memory: O(n)
func heapSort<T: Comparable>(_ a: [T]) -> [T] {
	var heap = Heap(a)
	var result: [T] = []
	while let min = heap.extractMin() {
		result.append(min)
	}
	return result
}

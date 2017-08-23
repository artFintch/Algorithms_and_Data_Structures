//
//  Quicksort.swift
//  Quicksort (Easy implementation)
//
//  Created by Vyacheslav Khorkov on 23/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

// Quicksort (Easy implementation).
// Time: O(n log n), if bad pivot: O(n^2)
// Memory: O(n)
func quicksort<T: Comparable>(_ a: [T]) -> [T] {
	guard a.count > 1 else { return a }
	let p = a[a.count / 2]
	return quicksort(a.filter { $0 < p }) +
		a.filter { $0 == p } +
		quicksort(a.filter { $0 > p })
}

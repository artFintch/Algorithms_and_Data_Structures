//
//  Merge.swift
//  Merge two arrays
//
//  Created by Vyacheslav Khorkov on 20/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

// Merge two arrays.
// Time: O(n + m)
// Memory: O(n + m)
func merge<T: Comparable>(_ a: [T], _ b: [T]) -> [T] {
	var i = 0, j = 0
	var r: [T] = []
	
	while i < a.count && j < b.count {
		if a[i] < b[j] {
			r.append(a[i])
			i += 1
		} else {
			r.append(b[j])
			j += 1
		}
	}
	
	(i..<a.count).forEach { r.append(a[$0]) }
	(j..<b.count).forEach { r.append(b[$0]) }
	
	return r
}

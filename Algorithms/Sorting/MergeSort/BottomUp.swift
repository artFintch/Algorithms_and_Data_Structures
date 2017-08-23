//
//  BottomUp.swift
//  MergeSort BottomUp
//
//  Created by Vyacheslav Khorkov on 22/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

// MergeSort BottomUp.
// Time: O(n log n)
// Memory: O(n)
func mergeSort<T: Comparable>(_ a: [T]) -> [T] {
	var b = [a, a] // Double-buffer. Memory: O(n).
	var bi = 0 // Index of read buffer.
	
	// Merges subarrays with size = width
	for width in sequence(first: 1, next: { $0 * 2 < a.count ? $0 * 2 : nil }) {
		// Iterates subarrays.
		for i in stride(from: 0, to: a.count, by: width * 2) {
			// Prepare left and right boundaries of subarrays.
			var l = i
			var r = i + width
			let lmax = min(l + width, a.count)
			let rmax = min(r + width, a.count)
			
			// Position in write buffer.
			var pos = i
			
			// Standart merge logic.
			while l < lmax && r < rmax {
				if b[bi][l] < b[bi][r] {
					b[1 - bi][pos] = b[bi][l]
					l += 1
				} else {
					b[1 - bi][pos] = b[bi][r]
					r += 1
				}
				pos += 1
			}
			while l < lmax {
				b[1 - bi][pos] = b[bi][l]
				l += 1
				pos += 1
			}
			while r < rmax {
				b[1 - bi][pos] = b[bi][r]
				r += 1
				pos += 1
			}
		}
		
		// Changes read buffer.
		bi = 1 - bi
	}
	
	return b[bi]
}

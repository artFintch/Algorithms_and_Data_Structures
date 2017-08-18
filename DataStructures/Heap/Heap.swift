//
//  Heap.swift
//  Binary min-heap.
//
//  Created by Vyacheslav Khorkov on 18/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

// Binary min-heap.
public struct Heap<Element: Comparable>: CustomDebugStringConvertible {
	// Return min element from heap.
	// Complexity: O(1)
	public var min: Element? { return a.first }
	
	// Returns true if heap is empty.
	// Complexity: O(1)
	public var isEmpty: Bool { return a.isEmpty }
	
	// Returns the count of elements.
	// Complexity: O(1)
	public var count: Int { return a.count }
	
	// Build heap with array.
	// Complexity: O(n)
	public init(_ a: [Element] = []) {
		build(a)
	}
	
	// Deletes and returns a minimum element from heap.
	// Complexity: O(log n)
	public mutating func extractMin() -> Element? {
		guard !isEmpty else { return nil }
		guard count > 1 else { return a.removeLast() }
		swap(0, a.count - 1)
		let root = a.removeLast()
		siftDown(0)
		return root
	}
	
	// Inserts a new element to heap and supports heap property.
	// Complexity: O(log n)
	public mutating func insert(_ element: Element) {
		a.append(element)
		siftUp()
	}
	
	// Build heap with array.
	// Complexity: O(n)
	private mutating func build(_ a: [Element]) {
		self.a = a
		for i in stride(from: a.count / 2 - 1, through: 0, by: -1) {
			siftDown(i)
		}
	}
	
	// Moves a node up in the tree, as long as needed.
	// Used to restore heap condition after insertion.
	// Complexity: O(log n)
	private mutating func siftUp() {
		var c = a.count - 1
		while let parent = parent(c) {
			guard a[c] < parent else { break }
			swap(c, parentIndex(c))
			c = parentIndex(c)
		}
	}
	
	// Moves a node down in the tree, similar to sift-up.
	// Used to restore heap condition after extractMin.
	// Complexity: O(log n)
	private mutating func siftDown(_ i: Int) {
		var p = i
		while let max = minChild(parent: p) {
			guard a[p] > max.child else { break }
			swap(p, max.index)
			p = max.index
		}
	}
	
	// Returns a minimum child of the parent and its index.
	// Complexity: O(1)
	private func minChild(parent: Int) -> (child: Element, index: Int)? {
		if let x = left(parent), let y = right(parent) {
			return x < y ?
				(child: x, index: leftIndex(parent)) :
				(child: y, index: rightIndex(parent))
		} else if let x = left(parent) {
			return (child: x, index: leftIndex(parent))
		} else if let y = right(parent) {
			return (child: y, index: rightIndex(parent))
		}
		return nil
	}
	
	// Swaps two elements by their indexes.
	// Complexity: O(1)
	private mutating func swap(_ i: Int, _ j: Int) {
		Swift.swap(&a[i], &a[j])
	}
	
	// Returns the parent element of child.
	// Complexity: O(1)
	private func parent(_ child: Int) -> Element? {
		let i = parentIndex(child)
		guard i >= 0 && i < a.count else { return nil }
		return a[i]
	}
	
	// Returns the left child element of parent.
	// Complexity: O(1)
	private func left(_ parent: Int) -> Element? {
		let i = leftIndex(parent)
		guard i < a.count else { return nil }
		return a[i]
	}
	
	// Returns the right child element of parent.
	// Complexity: O(1)
	private func right(_ parent: Int) -> Element? {
		let i = rightIndex(parent)
		guard i < a.count else { return nil }
		return a[i]
	}
	
	// Returns the parent index of child.
	// Complexity: O(1)
	@inline(__always) private func parentIndex(_ child: Int) -> Int {
		return child / 2 - 1
	}
	
	// Returns the left child index of parent.
	// Complexity: O(1)
	@inline(__always) private func leftIndex(_ parent: Int) -> Int {
		return parent * 2 + 1
	}
	
	// Returns the right child index of parent.
	// Complexity: O(1)
	@inline(__always) private func rightIndex(_ parent: Int) -> Int {
		return parent * 2 + 2
	}
	
	// The array of heap elements.
	private var a = [Element]()
	
	// Returns debug description.
	// Useful for tests.
	public var debugDescription: String {
		return a.description
	}
}

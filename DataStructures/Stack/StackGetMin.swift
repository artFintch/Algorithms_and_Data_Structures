//
//  Stack.swift
//  Stack based on two arrays.
//
//  Created by Vyacheslav Khorkov on 16/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

// Stack based on two arrays.
public struct Stack<Element: Comparable> {
	// Returns true if stack is empty.
	// Complexity: O(1)
	public var isEmpty: Bool { return a.isEmpty }
	
	// Returns the count of elements.
	// Complexity: O(1)
	public var count: Int { return a.count }
	
	// Returns the top element of stack.
	// Complexity: O(1)
	public var top: Element? { return a.last }
	
	// Returns the minimum element.
	// CompComplexity: O(1)
	public var min: Element? { return mins.last }
	
	// Appends a new element to the top.
	// Complexity: O(1)
	public mutating func push(_ element: Element) {
		a.append(element)
		mins.append(Swift.min(element, min ?? element))
	}
	
	// Removes and returns the top element.
	// Complexity: O(1)
	public mutating func pop() -> Element? {
		mins.popLast()
		return a.popLast()
	}
	
	// This stack based on array.
	// Memory: O(n)
	private var a: [Element] = []
	
	// Additional array for minimums.
	// Memory: O(n)
	private var mins: [Element] = []
}

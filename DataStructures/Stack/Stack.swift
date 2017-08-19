//
//  Stack.swift
//  Stack based on array
//
//  Created by Vyacheslav Khorkov on 30/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

// Stack based on array.
public struct Stack<Element> {
	// Returns true if stack is empty.
	// Complexity: O(1)
	public var isEmpty: Bool { return a.isEmpty }
	
	// Returns the count of elements.
	// Complexity: O(1)
	public var count: Int { return a.count }
	
	// Returns the top element of stack.
	// Complexity: O(1)
	public var top: Element? { return a.last }
	
	// Appends a new element to the top.
	// Complexity: O(1)
	public mutating func push(_ element: Element) {
		a.append(element)
	}
	
	// Removes and returns the top element.
	// Complexity: O(1)
	public mutating func pop() -> Element? {
		return a.popLast()
	}
	
	// This stack based on array.
	// Memory: O(n)
	private var a: [Element] = []
}

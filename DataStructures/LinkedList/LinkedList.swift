//
//  LinkedList.swift
//  Algorithms and Data Structures
//
//  Created by Vyacheslav Khorkov on 26/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

// Singly linked list without optimisations.
public final class LinkedList<Value> {
	// Returns the first value.
	// Complexity: O(1)
	public var first: Value? { return head?.value }
	
	// Returns the last value.
	// Complexity: O(n)
	public var last: Value? { return tail?.value }
	
	// Returns true if list is empty.
	// Complexity: O(1)
	public var isEmpty: Bool { return head == nil }
	
	// Returns the count of values.
	// Complexity: O(1)
	public private(set) var count = 0
	
	// Appends a new value to the end.
	// Complexity: O(n)
	public func append(value: Value) {
		let newNode = Node(value: value)
		if isEmpty {
			head = newNode
		} else {
			tail?.next = newNode
		}
		count += 1
	}
	
	// Inserts a new value at the index.
	// Complexity: O(n). If index equals 0: O(1).
	@discardableResult public func insert(value: Value, at index: Int) -> Bool {
		if index < 0 || index > count { return false }
		if index == count {
			append(value: value)
			return true
		}
		
		let newNode = Node(value: value)
		let prev = nodeAt(index: index - 1)
		if prev == nil {
			newNode.next = head
			head = newNode
		} else {
			let next = prev?.next
			prev?.next = newNode
			newNode.next = next
		}
		
		count += 1
		return true
	}
	
	// Removes all values.
	// Complexity: O(1)
	public func removeAll() {
		head = nil
		count = 0
	}
	
	// Removes the last value.
	// Complexity: O(n)
	@discardableResult public func removeLast() -> Value? {
		if count <= 1 {
			let headValue = head?.value
			removeAll()
			return headValue
		} else {
			let beforeTail = nodeAt(index: count - 2)
			let tail = beforeTail?.next
			beforeTail?.next = nil
			count -= 1
			return tail?.value
		}
	}
	
	// Removes a value at the index.
	// Complexity: O(n). If index equals 0: O(1).
	@discardableResult public func remove(at index: Int) -> Value? {
		if index < 0 || index >= count { return nil }
		if index == count - 1 { return removeLast() }
		if isEmpty { return nil }
		
		let prev = nodeAt(index: index - 1)
		let rem = prev?.next ?? head
		let next = rem?.next
		
		if index == 0 { head = next }
		
		prev?.next = next
		rem?.next = nil
		
		count -= 1
		return rem?.value
	}
	
	// Returns a value at the index.
	// Complexity: O(n)
	public subscript(index: Int) -> Value? {
		return nodeAt(index: index)?.value
	}
	
	// Convenience of use.
	private typealias Node = ListNode<Value>
	
	// Linked list node structure.
	private final class ListNode<Value> {
		let value: Value
		var next: Node?
		
		init(value: Value) {
			self.value = value
		}
	}
	
	// Returns head of list.
	// Complexity: O(1)
	private var head: Node?
	
	// Returns tail of list.
	// Complexity: O(n)
	private var tail: Node? {
		return nodeAt(index: count - 1)
	}
	
	// Returns a value at the index.
	// Complexity: O(n)
	private func nodeAt(index: Int) -> Node? {
		if isEmpty { return nil }
		if index < 0 || index >= count { return nil }
		
		var i = 0
		var cur = head
		while i != index {
			cur = cur?.next
			i += 1
		}
		return cur
	}
}

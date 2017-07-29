//
//  LinkedListWithTail.swift
//  Algorithms and Data Structures
//
//  Created by Vyacheslav Khorkov on 28/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

public final class LinkedListWithTail<Value> {
	
	private typealias Node = ListNode<Value>
	private final class ListNode<Value> {
		let value: Value
		var next: Node?
		
		init(value: Value) {
			self.value = value
		}
	}
	
	public var first: Value? { return head?.value }
	public var last: Value? { return tail?.value }
	public var isEmpty: Bool { return head == nil }
	public private(set) var count = 0
	
	// MARK: - Add new element
	
	public func append(value: Value) {
		let newNode = Node(value: value)
		if isEmpty {
			head = newNode
			tail = newNode
		} else {
			tail?.next = newNode
			tail = newNode
		}
		count += 1
	}
	
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
	
	// MARK: - Remove element(s)
	
	public func removeAll() {
		head = nil
		tail = nil
		count = 0
	}
	
	@discardableResult public func removeLast() -> Value? {
		if count <= 1 {
			let headValue = head?.value
			removeAll()
			return headValue
		} else {
			let beforeTail = nodeAt(index: count - 2)
			beforeTail?.next = nil
			let tailValue = tail?.value
			tail = beforeTail
			count -= 1
			return tailValue
		}
	}
	
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
	
	// MARK: - Get element
	
	public subscript(index: Int) -> Value? {
		return nodeAt(index: index)?.value
	}
	
	// MARK: - Private
	
	private var head: Node?
	private var tail: Node?
	
	private func nodeAt(index: Int) -> Node? {
		if isEmpty { return nil }
		if index < 0 || index >= count { return nil }
		if index == count - 1 { return tail }
		
		var i = 0
		var cur = head
		while i != index {
			cur = cur?.next
			i += 1
		}
		return cur
	}
	
}

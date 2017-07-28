//
//  LinkedList.swift
//  Algorithms and Data Structures
//
//  Created by Vyacheslav Khorkov on 26/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

public final class LinkedList<Value> {
	
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
		} else {
			tail?.next = newNode
		}
		count += 1
	}
	
	public func insert(value: Value, at index: Int) -> Bool {
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
		count = 0
	}
	
	public func removeLast() {
		if count <= 1 {
			removeAll()
		} else {
			nodeAt(index: count - 2)?.next = nil
			count -= 1
		}
	}
	
	public func remove(at index: Int) -> Value? {
		if index < 0 || index >= count { return nil }
		if isEmpty { return nil }
		
		let prev = nodeAt(index: index - 1)
		let rem = prev?.next ?? head
		let next = rem?.next
		rem?.next = nil
		if prev == nil {
			head = next
		} else {
			prev?.next = next
		}
		
		count -= 1
		return rem?.value
	}
	
	// MARK: - Get element
	
	public subscript(index: Int) -> Value? {
		return nodeAt(index: index)?.value
	}
	
	// MARK: - Private
	
	private var head: Node?
	private var tail: Node? {
		return nodeAt(index: count - 1)
	}
	
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

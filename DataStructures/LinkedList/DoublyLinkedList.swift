//
//  DoublyLinkedList.swift
//  Algorithms and Data Structures
//
//  Created by Vyacheslav Khorkov on 29/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

public final class DoublyLinkedList<Value> {
	
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
			newNode.prev = tail
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
		
		let new = Node(value: value)
		let cur = nodeAt(index: index)
		let prev = cur?.prev
		
		if prev == nil { head = new }
		
		new.prev = prev
		new.next = cur
		prev?.next = new
		cur?.prev = new
		
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
			let beforeTail = tail?.prev
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
		
		let rem = nodeAt(index: index)
		let prev = rem?.prev
		let next = rem?.next
		
		if index == 0 { head = next }
		
		rem?.prev = nil
		rem?.next = nil
		prev?.next = next
		next?.prev = prev
		
		count -= 1
		return rem?.value
	}
	
	// MARK: - Get element
	
	public subscript(index: Int) -> Value? {
		return nodeAt(index: index)?.value
	}
	
	// MARK: - Private
	
	private typealias Node = ListNode<Value>
	private final class ListNode<Value> {
		let value: Value
		var next: Node?
		weak var prev: Node?
		
		init(value: Value) {
			self.value = value
		}
	}
	
	private var head: Node?
	private var tail: Node?
	
	private func nodeAt(index: Int) -> Node? {
		if isEmpty { return nil }
		if index < 0 || index >= count { return nil }
		if index == count - 1 { return tail }
		
		let left = index < count / 2
		var i = left ? 0 : count - 1
		var cur = left ? head : tail
		while i != index {
			cur = left ? cur?.next : cur?.prev
			i += left ? 1 : -1
		}
		return cur
	}
	
}

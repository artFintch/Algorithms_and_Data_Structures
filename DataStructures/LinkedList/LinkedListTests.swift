//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Vyacheslav Khorkov on 28/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import XCTest
@testable import LinkedList

class LinkedListTests: XCTestCase {
    
	private let list = DoublyLinkedList<Int>()
	
	func testAppend() {
		XCTAssertTrue(list.isEmpty)
		
		list.append(value: 5)
		XCTAssertFalse(list.isEmpty)
		XCTAssertEqual(list.count, 1)
		XCTAssertEqual(list.first, 5)
		XCTAssertEqual(list[0], 5)
		XCTAssertEqual(list.last, 5)
		
		list.append(value: 9)
		XCTAssertFalse(list.isEmpty)
		XCTAssertEqual(list.count, 2)
		XCTAssertEqual(list[1], 9)
		XCTAssertEqual(list.last, 9)
	}
	
	func testInsert() {
		XCTAssertTrue(list.isEmpty)
		
		list.insert(value: 6, at: 0)
		XCTAssertFalse(list.isEmpty)
		XCTAssertEqual(list.count, 1)
		XCTAssertEqual(list.first, 6)
		XCTAssertEqual(list[0], 6)
		XCTAssertEqual(list.last, 6)
		
		list.insert(value: 8, at: 1)
		XCTAssertFalse(list.isEmpty)
		XCTAssertEqual(list.count, 2)
		XCTAssertEqual(list[1], 8)
		XCTAssertEqual(list.last, 8)
		
		list.insert(value: 2, at: 0)
		XCTAssertFalse(list.isEmpty)
		XCTAssertEqual(list.count, 3)
		XCTAssertEqual(list[2], 8)
		XCTAssertEqual(list.last, 8)
	}
	
	func testRemoveAll() {
		list.append(value: 5)
		list.append(value: 6)
		list.append(value: 7)
		
		list.removeAll()
		XCTAssertTrue(list.isEmpty)
		XCTAssertEqual(list.count, 0)
		XCTAssertNil(list.first)
		XCTAssertNil(list[0])
		XCTAssertNil(list.last)
	}
	
	func testRemoveLast() {
		list.append(value: 5)
		list.append(value: 6)
		list.append(value: 7)
		
		XCTAssertEqual(list.removeLast(), 7)
		XCTAssertEqual(list.count, 2)
		XCTAssertNil(list[2])
		
		XCTAssertEqual(list.removeLast(), 6)
		XCTAssertEqual(list.count, 1)
		XCTAssertNil(list[1])
		
		XCTAssertEqual(list.removeLast(), 5)
		XCTAssertEqual(list.count, 0)
		XCTAssertTrue(list.isEmpty)
	}
	
	func testRemoveAt() {
		list.append(value: 5)
		list.append(value: 6)
		list.append(value: 7)
		list.append(value: 8)
		list.append(value: 9)
		
		XCTAssertNil(list.remove(at: 5))
		
		XCTAssertEqual(list.remove(at: 2), 7)
		XCTAssertEqual(list.count, 4)
		XCTAssertEqual(list[1], 6)
		XCTAssertEqual(list[2], 8)
		
		XCTAssertEqual(list.remove(at: 3), 9)
		XCTAssertEqual(list.count, 3)
		XCTAssertEqual(list[1], 6)
		XCTAssertEqual(list[2], 8)
		
		XCTAssertEqual(list.remove(at: 0), 5)
		XCTAssertEqual(list.count, 2)
		XCTAssertEqual(list[0], 6)
		XCTAssertEqual(list[1], 8)
	}
	
	func testGet() {
		XCTAssertNil(list.first)
		XCTAssertNil(list.last)
		XCTAssertNil(list[0])
		
		list.append(value: 5)
		list.append(value: 6)
		list.append(value: 7)
		XCTAssertEqual(list.first, 5)
		XCTAssertEqual(list[0], 5)
		XCTAssertEqual(list[1], 6)
		XCTAssertEqual(list.last, 7)
		XCTAssertEqual(list[2], 7)
		XCTAssertNil(list[-1])
		XCTAssertNil(list[4])
	}
	
	func testPerformance() {
		measure {
			for i in 0...10000 { self.list.append(value: i) }
			while !self.list.isEmpty {
				self.list.remove(at: Int(arc4random_uniform(UInt32(self.list.count - 1))))
			}
		}
	}
	
}

//
//  QueueTests.swift
//  QueueTests
//
//  Created by Vyacheslav Khorkov on 31/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import XCTest
@testable import Queue

class QueueTests: XCTestCase {
	
	var queue = Queue<Int>(maxEmptySpacesPercent: 0.5, minCountForOptimise: 4)
	
    func testEnque() {
		XCTAssertTrue(queue.isEmpty)
		XCTAssertEqual(queue.count, 0)
		
		queue.enque(2)
		queue.enque(4)
		queue.enque(8)
		queue.enque(10)
		XCTAssertFalse(queue.isEmpty)
		XCTAssertEqual(queue.count, 4)
    }
	
	func testDeque() {
		queue.enque(2)
		queue.enque(4)
		queue.enque(8)
		queue.enque(10)
		
		XCTAssertEqual(queue.deque(), 2)
		XCTAssertEqual(queue.deque(), 4)
		XCTAssertEqual(queue.deque(), 8)
		XCTAssertEqual(queue.deque(), 10)
		XCTAssertTrue(queue.isEmpty)
		XCTAssertEqual(queue.count, 0)
	}
	
}

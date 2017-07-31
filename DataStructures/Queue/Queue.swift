//
//  Queue.swift
//  Queue
//
//  Created by Vyacheslav Khorkov on 31/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

public struct Queue<T> {
	
	public var first: T? { return isEmpty ? nil : array[head] }
	public var count: Int { return array.count - head }
	public var isEmpty: Bool { return count == 0 }
	
	init(maxEmptySpacesPercent: Float = Const.maxEmptySpacesPercent,
	     minCountForOptimise: Int = Const.minCountForOptimise)
	{
		self.maxEmptySpacesPercent = maxEmptySpacesPercent
		self.minCountForOptimise = minCountForOptimise
	}
	
	public mutating func enque(_ newElement: T?) {
		array.append(newElement)
	}
	
	public mutating func deque() -> T? {
		guard let first = first else { return nil }
		
		array[head] = nil
		head += 1
		
		if array.count >= minCountForOptimise &&
			Float(head) / Float(array.count) > maxEmptySpacesPercent {
			array.removeFirst(head)
			head = 0
		}
		
		return first
	}
	
	// MARK: - Private
	
	private enum Const {
		static var maxEmptySpacesPercent: Float { return 0.25 }
		static var minCountForOptimise: Int { return 50 }
	}
	
	private var head = 0
	private var array = [T?]()
	private let maxEmptySpacesPercent: Float
	private let minCountForOptimise: Int
	
}

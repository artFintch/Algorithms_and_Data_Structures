//
//  Stack.swift
//  Stack GetMin()
//
//  Created by Vyacheslav Khorkov on 16/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

public struct Stack<T> {
	
	public var isEmpty: Bool { return array.isEmpty }
	public var count: Int { return array.count }
	public var top: T? { return array.last }
	public var min: T? { return minimums.last }
	
	public mutating func push(_ value: T) {
		array.append(value)
		minimums.append(Swift.min(value, min ?? value))
	}
	
	public mutating func pop() -> T? {
		minimums.popLast()
		return array.popLast()
	}
	
	// MARK: - Private
	
	private var array = [T]()
	private var minimums = [T]()
	
}

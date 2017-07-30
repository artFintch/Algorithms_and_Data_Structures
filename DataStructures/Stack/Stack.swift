//
//  Stack.swift
//  Stack
//
//  Created by Vyacheslav Khorkov on 30/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

public struct Stack<T> {
	
	public var isEmpty: Bool { return array.isEmpty }
	public var count: Int { return array.count }
	public var top: T? { return array.last }
	
	public mutating func push(_ value: T) {
		array.append(value)
	}
	
	public mutating func pop() -> T? {
		return array.popLast()
	}
	
	// MARK: - Private
	
	private var array = [T]()
	
}

//
//  Merge.swift
//  Algorithms and Data Structures
//
//  Created by Vyacheslav Khorkov on 03/08/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import Foundation

func merge(_ a: inout [String], _ b: inout [String], _ r: inout [String]) {
    if a.isEmpty { return r.append(contentsOf: b) }
    if b.isEmpty { return r.append(contentsOf: a) }
    r.append(a[0] < b[0] ? a.removeFirst() : b.removeFirst())
    merge(&a, &b, &r)
}

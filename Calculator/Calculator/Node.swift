//
//  Node.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/16.
//

import Foundation

class Node {
    var number: Int?
    var next: Node?
    var operater: String?
    var isPostive: Bool?

    init(number: Int, next: Node? = nil, operater: String, isPostive: Bool) {
        self.number = number
        self.next = next
        self.operater = operater
        self.isPostive = isPostive
    }
}

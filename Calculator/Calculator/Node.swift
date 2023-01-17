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
    var operation: Operation?
    var isPostive: Bool = true

    init(number: Int, next: Node? = nil, operation: Operation) {
        self.number = number
        self.next = next
        self.operation = operation
    }
}

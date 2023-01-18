//
//  Node.swift
//  Calculator
//
//  Created by Jason on 2023/01/16.
//

import Foundation

final class  Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.next == rhs.next
    }
    
    var next: Node?
    var data: Double
    var operators: Operator?
    
    init(next: Node? = nil, data: Double, operators: Operator? = nil) {
        self.next = next
        self.data = data
        self.operators = operators
    }
}

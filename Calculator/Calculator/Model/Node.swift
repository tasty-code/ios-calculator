//
//  Node.swift
//  Calculator
//
//  Created by Jason on 2023/01/16.
//

import Foundation

final class  Node {
    var next: Node?
    var data: Double
    var operators: Operators?
    
    init(next: Node? = nil, data: Double, operators: Operators? = nil) {
        self.next = next
        self.data = data
        self.operators = operators
    }
}

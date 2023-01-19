//
//  ItemNode.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/17.
//

import Foundation

final class ItemNode {
    let data: Value
    var next: ItemNode?
    
    init(data: Value, next: ItemNode? = nil) {
        self.data = data
        self.next = next
    }
}

struct Value {
    let operators: Operator?
    let number: Double
}

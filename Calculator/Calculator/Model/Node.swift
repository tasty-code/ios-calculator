//
//  Node.swift
//  Calculator
//
//  Created by Jason on 2023/01/16.
//

import Foundation

final class Node<Element>: Equatable {
    
    var next: Node?
    var data: Element
    
    init(next: Node? = nil, data: Element, operators: Operator? = nil) {
        self.next = next
        self.data = data
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.next == rhs.next
    }
}

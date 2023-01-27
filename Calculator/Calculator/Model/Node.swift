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
    
    init(next: Node? = nil, data: Element) {
        self.next = next
        self.data = data
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return type(of: lhs.data) == type(of: rhs.data)
    }
}

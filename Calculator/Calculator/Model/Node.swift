//
//  Node.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/16.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node?

    init(value: T, next: Node? = nil) {
        self.value = value
    }
}



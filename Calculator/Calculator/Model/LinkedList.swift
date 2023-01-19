//
//  LinkedList.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/16.
//

import Foundation

class Node<Value> {
    var value: Value
    var next: Node<Value>? = nil

    init(value: Value) {
        self.value = value
    }
}

struct LinkedList<Value> {
    var head: Node<Value>? = nil
    var tail: Node<Value>? = nil

    @discardableResult
    mutating func removeFirst() -> Value? {
        defer {
            head = head?.next
            if head == nil {
                tail = nil
            }
        }

        return head?.value
    }

    mutating func append(_ value: Value) {
        let node = Node(value: value)

        if head == nil {
            head = node
            tail = head
            return
        }

        tail?.next = node
        tail = node
    }
}

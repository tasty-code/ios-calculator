//
//  LinkedList.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/16.
//

import Foundation

final class Node<Value> {
    var value: Value
    var next: Node<Value>? = nil

    init(value: Value) {
        self.value = value
    }
}

struct LinkedList<Value> {
    var head: Node<Value>? = nil
    var tail: Node<Value>? = nil
    var count = 0

    @discardableResult
    mutating func removeFirst() -> Value? {
        defer {
            head = head?.next
            if head == nil {
                tail = nil
                count = 0
            } else {
                count -= 1
            }
        }

        return head?.value
    }

    mutating func append(_ value: Value) {
        let node = Node(value: value)
        count += 1

        if head == nil {
            head = node
            tail = head
            return
        }

        tail?.next = node
        tail = node
    }
}

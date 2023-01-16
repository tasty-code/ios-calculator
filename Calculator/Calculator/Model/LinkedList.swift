//
//  LinkedList.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/16.
//

import Foundation

class LinkedList<Value> {
    var head: Node<Value>? = nil
    var tail: Node<Value>? = nil

    func removeFirst() -> Value? {
        let removedValue = head?.value
        
        let newHead = head?.next
        head = nil
        head = newHead
        
        return removedValue
    }
    
    func append(_ value: Value) {
        let node = Node(value: value)
        
        guard head != nil else {
            head = node
            tail = head
            return
        }
        
        tail?.next = node
        tail = node
    }
}

class Node<Value> {
    var value: Value
    var next: Node<Value>?
    
    init(value: Value, next: Node<Value>? = nil) {
        self.value = value
        self.next = next
    }
}

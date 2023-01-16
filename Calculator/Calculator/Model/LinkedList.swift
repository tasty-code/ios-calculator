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
    
    func removeFirst() -> Node<Value>? {
        return nil
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

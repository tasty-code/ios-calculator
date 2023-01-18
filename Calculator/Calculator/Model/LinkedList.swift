//
//  LinkedList.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/17.
//

import Foundation

class LinkedList {
    var head: Node?
    
    func enqueue(number: Double, operation: Operation) {
        if head == nil {
            head = Node(number: number, operation: operation)
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(number: number, operation: operation)
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/16.
//

import Foundation

class CalculatorItemQueue {
    private var head: Node?
    
    
    func append(number: Int, operation: Operation) {
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



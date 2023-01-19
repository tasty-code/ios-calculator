//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/17.
//

import Foundation

protocol CalculateItem {
}

struct CalculatorItemQueue: CalculateItem {
    private let queue: LinkedList = LinkedList()
    
    func enqueue(data: Value) {
        queue.append(data: data)
    }
    
    func dequeue() {
        queue.remove()
    }
}

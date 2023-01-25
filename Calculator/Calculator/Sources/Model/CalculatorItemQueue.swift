//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/17.
//

import Foundation

struct CalculatorItemQueue {
    private let queue: LinkedList = LinkedList()
    
    func enqueue(data: String) {
        queue.append(data: data)
    }
    
    func dequeue() -> String? {
        return queue.remove()
    }
    
    func count() -> Int {
        return queue.count()
    }
}



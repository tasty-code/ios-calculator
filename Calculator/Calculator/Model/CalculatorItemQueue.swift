//
//  CalculatorItemQueu.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/20.
//

import Foundation

struct CalculatorItemQueue<T> {
    var queue: [T] = []
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(value: T) {
        return queue.append(value)
    }
    
    mutating func dequeue() -> T? {
        isEmpty ? nil : queue.removeFirst()
    }
}

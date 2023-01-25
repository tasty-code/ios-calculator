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
    var count: Int {
        return queue.count
    }
    mutating func enqueue(value: T) {
        return queue.append(value)
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}

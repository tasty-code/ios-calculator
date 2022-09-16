//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 정재근 on 2022/09/05.
//

import Foundation

struct CalculatorItemQueue<T> {
    private var queue: [T] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public func getQueue() -> [T] {
        return queue
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        queue.removeFirst()
    }
    
    public mutating func clearAll() {
        queue.removeAll()
    }
    
    public mutating func removeLast() {
        queue.removeLast()
    }
}

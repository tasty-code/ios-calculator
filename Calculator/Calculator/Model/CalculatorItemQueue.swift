//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 정재근 on 2022/09/05.
//

import Foundation

class CalculatorItemQueue<Number>: CalculateItem {
    private var queue: [Number] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public func enqueue(_ element: Number) {
        queue.append(element)
    }
    
    public func dequeue() -> Number? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    public func clearAll() {
        queue.removeAll()
    }
    
    public func removeLast() {
        queue.removeLast()
    }
}

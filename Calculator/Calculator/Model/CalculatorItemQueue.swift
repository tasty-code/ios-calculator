//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 정재근 on 2022/09/05.
//

import Foundation

class CalculatorItemQueue<T>: CalculateItem {
    private var queue: [T] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    public func clearAll() {
        queue = []
    }
    
    public func clearLast() {
        queue.removeLast()
    }
}

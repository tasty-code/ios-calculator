//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 정재근 on 2022/09/05.
//

import Foundation

class CalculatorItemQueue<Number>: CalculateItem {
    private var queue: [Number] = []
    private var idx: Int = 0
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return !(queue.count > idx)
    }
    
    public func getQueue() -> [Number] {
        return queue
    }
    
    public func enqueue(_ element: Number) {
        queue.append(element)
    }
    
    public func dequeue() -> Number {
        defer {
            idx += 1
        }
        return queue[idx]
    }
    
    public func clearAll() {
        queue.removeAll()
    }
    
    public func removeLast() {
        queue.removeLast()
    }
}

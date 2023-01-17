//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by devxsby on 2023/01/16.
//

import Foundation

protocol CalculateItem { }

struct CalculatorItemQueue<T>: CalculateItem {
    
    var data = [T]()
    public init() {}
    
    public var count: Int {
        return data.count
    }
    
    public var isEmpty: Bool {
        return data.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        return data.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : data.removeFirst()
    }
    
    public mutating func clear() {
        return data.removeAll()
    }
}

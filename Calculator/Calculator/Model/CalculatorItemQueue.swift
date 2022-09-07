//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이은호 on 2022/09/06.
//

import Foundation

protocol CalculateItem {
    
}

class CalculatorItemQueue<T>: CalculateItem {
    private var data: [T?] = []
    
    public var count: Int {
        return data.count
    }
    
    public var isEmpty: Bool {
        return data.isEmpty
    }
    
    public func enqueue(_ element: T) {
        data.append(element)
    }
    
    public func dequeue() -> T? {
        return isEmpty ? nil : data.removeFirst()
    }
    
    public func clearAll() {
        data.removeAll()
    }

    public func removeLast() {
        data.removeLast()
    }
    
}



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
    
    var count: Int {
        return data.count
    }
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        return data.append(element)
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : data.removeFirst()
    }
    
    mutating func clear() {
        return data.removeAll()
    }
}

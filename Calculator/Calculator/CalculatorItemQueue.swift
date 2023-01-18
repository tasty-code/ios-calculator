//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by devxsby on 2023/01/16.
//

import Foundation

protocol CalculateItem { }

struct CalculatorItemQueue<ElementType>: CalculateItem {
    
    var elements = [ElementType]()
    
    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func enqueue(_ element: ElementType) {
        return elements.append(element)
    }
    
    mutating func dequeue() -> ElementType? {
        return isEmpty ? nil : elements.removeFirst()
    }
    
    mutating func clear() {
        return elements.removeAll()
    }
}

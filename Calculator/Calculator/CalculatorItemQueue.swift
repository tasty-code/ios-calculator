//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by devxsby on 2023/01/16.
//

import Foundation

protocol CalculateItem { }

extension Double: CalculateItem { }

struct CalculatorItemQueue<Element: CalculateItem> {
    
    var elements = [Element]()
    
    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        return elements.append(element)
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
    
    mutating func clear() {
        return elements.removeAll()
    }
}

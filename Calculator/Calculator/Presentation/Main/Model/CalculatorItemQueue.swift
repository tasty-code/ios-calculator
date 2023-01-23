//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by devxsby on 2023/01/16.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    
    var enqueueElements = [Element]()
    var dequeueElements = [Element]()
    
    var count: Int {
        return enqueueElements.count
    }
    
    var isEmpty: Bool {
        return enqueueElements.isEmpty && dequeueElements.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        return enqueueElements.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if dequeueElements.isEmpty {
            dequeueElements = enqueueElements.reversed()
            enqueueElements.removeAll()
        }
        return dequeueElements.popLast()
    }
    
    mutating func clear() {
        enqueueElements.removeAll()
        dequeueElements.removeAll()
    }
}

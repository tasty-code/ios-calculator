//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/17.
//

import Foundation

struct CalculatorItemQueue<Element> {
    var elements = LinkedList<Element>()
    
    var head: Element? {
        elements.head?.value
    }
    
    var tail: Element? {
        elements.tail?.value
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        return elements.removeFirst()
    }
}

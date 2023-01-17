//
//  CalculateItemQueue.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/17.
//

import Foundation

struct CalculateItemQueue<Element> {
    var elements = LinkedList<Element>()
    
    var head: Element? {
        elements.head?.value
    }
    
    var tail: Element? {
        elements.tail?.value
    }
    
    func enqueue(_ element: Element) {
        
    }
    
    @discardableResult
    func dequeue() -> Element? {
        return nil
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/16.
//

import Foundation

struct CalculatorItemQueue<Element: CalculatorItem> {
    var linkedList: LinkedList<Element> = LinkedList()
    
    mutating func enQueue(element: Element) {
        linkedList.append(data: element)
    }
    
    func deQueue() {
        linkedList.removeLast()
    }
}

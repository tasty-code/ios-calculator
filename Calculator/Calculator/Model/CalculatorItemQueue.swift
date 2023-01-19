//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/17.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    var elements = LinkedList<Element>()

    var front: Element? {
        elements.head?.value
    }

    var rear: Element? {
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

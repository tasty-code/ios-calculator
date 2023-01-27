//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/16.
//

import Foundation

struct CalculatorItemQueue<Element: CalculatorItem> {
    private var linkedList: LinkedList<Element> = LinkedList()
    
    func isHeadEmpty() -> Bool {
        return linkedList.isHeadEmpty()
    }
    
    func getHead() -> Node<Element>? {
        guard let result = linkedList.getHead() else{ return nil }
        return result
    }
    
    mutating func popHead() -> Element? {
        return linkedList.popHead()
    }
    
    mutating func enqueue(element: Element) {
        linkedList.append(data: element)
    }
    
    mutating func dequeue() {
        linkedList.removeLast()
    }
}

extension CalculatorItemQueue: Equatable {
    static func == (lhs: CalculatorItemQueue<Element>, rhs: CalculatorItemQueue<Element>) -> Bool {
        return type(of: lhs.getHead()?.data) == type(of: rhs.getHead()?.data)
    }
}

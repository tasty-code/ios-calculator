//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by J.E on 2023/01/16.
//

import Foundation

struct CalculatorItemQueue<Item: CalculateItem> {
    private(set) var items = [String]()
    
    func isEmpty() -> Bool {
        items.isEmpty
    }
    
    func count() -> Int {
        items.count
    }
    
    mutating func enqueue(item: String) {
        items.append(item)
    }
    
    mutating func dequeue() throws -> String {
        guard !items.isEmpty else {
            throw CalculatorError.noElementToDelete
        }
        return items.removeFirst()
    }
}

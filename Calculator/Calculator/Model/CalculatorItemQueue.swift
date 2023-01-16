//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by J.E on 2023/01/16.
//

import Foundation

struct CalculatorItemQueue: CalculateItem {
    private(set) var itemArray = [String]()
    
    func isEmpty() -> Bool {
        itemArray.isEmpty
    }
    
    func count() -> Int {
        itemArray.count
    }
    
    mutating func enqueue(item: String) {
        itemArray.append(item)
    }
    
    mutating func dequeue() throws {
        guard !itemArray.isEmpty else {
            throw CalculatorError.noElementToDelete
        }
        itemArray.removeFirst()
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 천승희 on 2022/09/06.
//

import Foundation

protocol CalculateItem {
}

struct CalculatorItemQueue: CalculateItem {
    private var itemStorage: [String] = []
    
    mutating func enqueue(_ item: String) {
        itemStorage.append(item)
    }
    
    mutating func dequeue() -> String {
        return itemStorage.removeFirst()
    }
    
    func isEmpty() -> Bool {
        if itemStorage.isEmpty {
            return true
        }
        
        return false
    }
}

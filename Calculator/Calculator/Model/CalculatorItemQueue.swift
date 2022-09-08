//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 천승희 on 2022/09/06.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    private var itemStorage: [T] = []
    
    mutating func enqueue(_ item: T) {
        itemStorage.append(item)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty() {
            return nil
        }
        
        return itemStorage.removeFirst()
    }
    
    mutating func removeLast() {
        if isEmpty() {
            itemStorage.removeLast()
        }
    }
    
    func isEmpty() -> Bool {
        itemStorage.isEmpty
    }
    
    func count() -> Int {
        itemStorage.count
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 정연호 on 2022/09/07.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T>: CalculateItem {
    var list: [T] = []
    
    mutating func enqueue(_ item: T) {
        list.append(item)
    }
    
    mutating func dequeue() -> T {
        return list.removeFirst()
    }
    
    mutating func clear() {
        list.removeAll()
    }
    
    func peak() throws -> T {
        if let item = list.first {
            return item
        } else {
            throw CalculatorError.noValue
        }
    }
    
    func count() -> Int {
        return list.count
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
}

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
    var isEmpty: Bool {
        return list.isEmpty
    }
    var count: Int {
        return list.count
    }
    
    mutating func enqueue(_ item: T) {
        list.append(item)
    }
    
    mutating func dequeue() throws -> T {
        guard list.isEmpty else {
            throw CalculatorError.noValue
        }
        return list.removeFirst()
    }
    
    mutating func clear() {
        list.removeAll()
    }
    
    func peek() throws -> T {
        if let item = list.first {
            return item
        } else {
            throw CalculatorError.noValue
        }
    }
    
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 정연호 on 2022/09/07.
//

import Foundation


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
            return list.removeFirst()
        }
        throw CalculatorError.noValue
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

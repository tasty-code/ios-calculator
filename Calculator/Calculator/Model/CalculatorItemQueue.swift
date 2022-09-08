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
    
    mutating func dequeue() -> T? {
        guard list.isEmpty else {
            return list.removeFirst()
        }
        return nil
    }
    
    mutating func clear() {
        list.removeAll()
    }
    
    func peek() -> T? {
        guard let item = list.first else {
            return nil
        }
        return item
    }
    
}

//
//  Queue.swift
//  Calculator
//
//  Created by 이상윤 on 2023/01/16.
//

import Foundation

protocol CalculateItem {
    var value: Double { get set }
    var toggle: Toggle { get set }
    var `operator`: Operator { get set }
}

struct Item: CalculateItem, Equatable {
    var value: Double
    var toggle: Toggle
    var `operator`: Operator
}

struct CalculateItemQueue<T: CalculateItem> {
    var queue: Array<T> = []
    
    mutating func enqueue(_ data: T) {
        queue.append(data)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        guard !queue.isEmpty else {
            return nil
        }
        return queue.removeFirst()
    }
    
    mutating func allClear() {
        queue.removeAll()
    }
}

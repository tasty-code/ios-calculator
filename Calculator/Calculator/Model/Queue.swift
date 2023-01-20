//
//  LinkedList.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/17.
//

import Foundation

struct Queue<T> {
    var queue: [T] = []
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(value: T) {
        return queue.append(value)
    }
    
    mutating func dequeue(value: T) -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}

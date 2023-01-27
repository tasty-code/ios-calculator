//
//  CalculateItemQueue.swift
//  Calculator
//
//  Created by 이상윤 on 2023/01/16.
//

import Foundation

struct CalculateItemQueue<T: CalculateItem> {
    private var queue: Array<T>

    init(queue: Array<T> = []) {
        self.queue = queue
    }

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

    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}

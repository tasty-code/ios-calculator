//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 천승희 on 2022/09/06.
//

import Foundation

struct CalculatorItemQueue: CalculateItem {
    private var itemStorage: [Any] = []
    
    mutating func enqueue(_ item: Any) {
        itemStorage.append(item)
    }
    
    mutating func dequeue() -> Any {
        itemStorage.removeFirst()
    }
    
    mutating func removeLast() {
        itemStorage.removeLast()
    }
    
    func isEmpty() -> Bool {
        itemStorage.isEmpty
    }
    
    func count() -> Int {
        itemStorage.count
    }
}

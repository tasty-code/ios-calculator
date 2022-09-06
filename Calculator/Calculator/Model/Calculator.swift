//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 천승희 on 2022/09/06.
//

import Foundation

//protocol CalculateItem {
//}

class CalculatorItemQueue {
    var itemStorage: [String] = []
    
    func enqueue(_ item: String) {
        itemStorage.append(item)
    }
    
    func dequeue() -> String {
        return itemStorage.removeFirst()
    }
}

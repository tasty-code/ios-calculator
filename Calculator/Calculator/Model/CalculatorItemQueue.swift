//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 정재근 on 2022/09/05.
//

import Foundation

class CalculatorItemQueue: CalculateItem {
    private var inputNumberQueue = Queue<Int>()
    private var operatorQueue = Queue<String>()
    
    func plus(leftNumer: Int, rightNumber: Int) -> Int {
        return leftNumer + rightNumber
    }
    
    func minus(leftNumer: Int, rightNumber: Int) -> Int {
        return leftNumer + rightNumber
    }
    
    func multiply(leftNumer: Int, rightNumber: Int) -> Int {
        return leftNumer * rightNumber
    }
    
    func division(leftNumer: Int, rightNumber: Int) -> Int {
        return leftNumer / rightNumber
    }
    
    func clearAll() {
        inputNumberQueue.clearAll()
        operatorQueue.clearAll()
    }
}

//
//  Formula.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/19.
//

import Foundation

struct Formula<T> {
    var operands: CalculatorItemQueue<T> = CalculatorItemQueue() // 숫자
    var operators: CalculatorItemQueue<T> = CalculatorItemQueue()
//    public func result() -> Double {
//
//    }
}

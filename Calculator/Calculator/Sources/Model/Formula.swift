//
//  Formula.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/25.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    func result() -> Double {
        guard let firstHead = operands.dequeue(), var middleResult = Double(firstHead) else { return 0.0 }
        
        while let nextNode = operands.dequeue() {
            guard let rhs = Double(nextNode) else { break }
            guard let stringOperator = operators.dequeue(), let eachOperator = Operator(rawValue: stringOperator[stringOperator.startIndex]) else { break }

            middleResult = eachOperator.calculate(lhs: middleResult, rhs: rhs)
        }
        return middleResult
    }
}

//
//  Formula.swift
//  Calculator
//
//  Created by 김용재 on 2023/01/17.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        var result: Double = 0.0
        result = operands.dequeue() ?? 0.0
        
        while !operators.isEmpty {
            guard let dequeuedOperand = operands.dequeue(),
                  let dequeuedOperator = operators.dequeue() else { return 0.0 }
            result = dequeuedOperator.calculate(lhs: result, rhs: dequeuedOperand)
        }
        return result
    }
}

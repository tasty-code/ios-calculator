//
//  Formula.swift
//  Calculator
//
//  Created by 박도원 on 2022/09/13.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator.RawValue>
    
    mutating func result() throws -> Double {
        var result: Double = 0
        while !operands.isEmpty && !operators.isEmpty {
            guard let lhs = operands.dequeue(),
                    let rhs = operands.dequeue(),
                    let operators = operators.dequeue(),
                    let calculateValue = Operator(rawValue: operators)?.calculate(lhs: lhs, rhs: rhs) else {
                throw CalculatorError.calculateFailure
            }
            result += calculateValue
        }
        return result
    }
}

//
//  Formula.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/19.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    public mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            throw CalculateError.unavailableDequeue
        }
        guard operands.count == operators.count else {
            throw CalculateError.operandOperatorCountNotMatching
        }
        for _ in 1...operators.count {
            guard let calculateOperator = operators.dequeue(),
                  let operand = operands.dequeue() else {
                throw CalculateError.unavailableDequeue
            }
            if calculateOperator == .divide && operand == 0 {
                throw CalculateError.zeroDivideError
            }
            result = calculateOperator.caclulate(lhs: result, rhs: operand)
        }
        return result
    }
}

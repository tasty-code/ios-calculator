//
//  Formula.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/17.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }

    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            throw CalculatorError.invalidDequeue
        }

        guard operands.count == operators.count else {
            throw CalculatorError.notMatchingCountOfOperatorsAndOperands
        }

        for _ in 0..<operators.count {
            guard let calculateOperator = operators.dequeue(),
                  let operand = operands.dequeue() else {
                throw CalculatorError.invalidDequeue
            }

            if calculateOperator == .divide && operand == 0 {
                throw CalculatorError.divideByZero
            }

            result = calculateOperator.calculate(lhs: result, rhs: operand)
        }

        return result
    }
}

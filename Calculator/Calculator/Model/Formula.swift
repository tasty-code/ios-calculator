//
//  Formula.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/17.
//

import Foundation

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>

    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }

    mutating func result() -> Double {
        guard var result = operands.dequeue() else { return 0 }

        for _ in 1...operators.count {
            guard let calculateOperator = operators.dequeue(),
                  let operand = operands.dequeue() else { return result }

            result = calculateOperator.calculate(lhs: result, rhs: operand)
        }

        return result
    }
}

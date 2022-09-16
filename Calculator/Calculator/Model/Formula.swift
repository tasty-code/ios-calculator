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
    
    mutating func result() -> Double {
        guard let lhs = operands.dequeue(),
                let rhs = operands.dequeue(),
                let operators = operators.dequeue(),
                let result = Operator(rawValue: operators)?.calculate(lhs: lhs, rhs: rhs) else {
            return 0
        }
        return result
    }
}

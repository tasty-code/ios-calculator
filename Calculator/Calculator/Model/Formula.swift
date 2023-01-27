//
//  Formula.swift
//  Calculator
//
//  Created by J.E on 2023/01/20.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        try (1...operators.count()).reduce(0.0) { initialResult, _  in
            let anOperand = (try? operands.dequeue()) ?? 0.0
            let anOperator = (try? operators.dequeue()) ?? .add
            guard (anOperator, anOperand) != (.divide, 0.0) else {
                throw CalculatorError.divideByZero
            }
            
            return anOperator.calculate(lhs: initialResult, rhs: anOperand)
        }
    }
}

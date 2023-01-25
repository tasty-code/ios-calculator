//
//  Formula.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/19.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>// 숫자
    var operators: CalculatorItemQueue<Operator>
    
    public mutating func result() throws -> Double {
        guard var result = operands.dequeue() else {
            throw CalculateError.normalError
        }
        
        for _ in 1...operators.count {
            guard let calculateOperator = operators.dequeue(),
                  let operand = operands.dequeue() else {
                throw CalculateError.normalError
                  }
            if calculateOperator == .divide && operand == 0 {
                print("0으로 못나눔")
            }
            result = calculateOperator.caclulate(lhs: result, rhs: operand)
        }
        
        return result
    }
}

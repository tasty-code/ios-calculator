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
        var tempResult: Double = 0.0
        tempResult = operands.dequeue() ?? 0.0
        
        while !operators.isEmpty {
            tempResult = operators.dequeue()?.calculate(lhs: tempResult, rhs: operands.dequeue() ?? 0.0) ?? 0.0
        }
        return tempResult
    }
}

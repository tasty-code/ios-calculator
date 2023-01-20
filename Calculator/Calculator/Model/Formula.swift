//
//  Formula.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/18.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard let head = operands.getHead() else { return 0.0 }
        
        var result = 0.0
        
        if head.next == nil {
            guard let data = operands.popHead() else { return 0.0 }
            return data
        } else {
            while operands.getHead() != nil {
                guard let rhsValue = operands.popHead() else { return 0.0 }
                guard let lhsValue = operands.popHead() else { return rhsValue }
                guard let operatorValue = operators.popHead() else { return rhsValue }
                
                result = operatorValue.calculate(lhs: rhsValue, rhs: lhsValue)
            }
            return result
        }
        
    }
}


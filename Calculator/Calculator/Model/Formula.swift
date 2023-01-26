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
        guard let headData = operands.popHead() else { return 0.0 }
        
        var result = headData
        
        if head.next == nil {
            guard let data = operands.popHead() else { return 0.0 }
            return data
        } else {
            while operands.getHead() != nil {
                guard let operatorValue = operators.popHead() else { return result }
                guard let lhsValue = operands.popHead() else { return result }
                
                
                result = operatorValue.calculate(lhs: result, rhs: lhsValue)
            }
            return result
        }
    }
}

extension Formula: Equatable {
    static func == (lhs: Formula, rhs: Formula) -> Bool {
        return lhs.operands == rhs.operands && lhs.operators == rhs.operators
    }
}

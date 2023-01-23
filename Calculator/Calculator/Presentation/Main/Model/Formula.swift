//
//  Formula.swift
//  Calculator
//
//  Created by 김용재 on 2023/01/17.
//

import Foundation

struct Formula {
    
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    init(operandsList: [Double], operatorsList: [Operator]) {
        operandsList.forEach {
            self.operands.enqueue($0)
        }
        operatorsList.forEach {
            self.operators.enqueue($0)
        }
    }
    
    mutating func result() -> Double {
        guard var result = operands.dequeue() else { return 0.0 }
        
        while !operators.isEmpty {
            guard let dequeuedOperand = operands.dequeue(),
                  let dequeuedOperator = operators.dequeue() else { return 0.0 }
            result = dequeuedOperator.calculate(lhs: result, rhs: dequeuedOperand)
        }
        return result
    }
}

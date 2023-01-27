//
//  Formula.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/25.
//

import UIKit

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    func result() throws -> Double {
        guard var firstHead = operands.dequeue() else {
            throw CalculateError.invalidInput
        }
        
        if firstHead.contains("*") {
            firstHead = firstHead.replacingOccurrences(of: "*", with: "-")
        }
        
        guard var middleResult = Double(firstHead) else {
            throw CalculateError.invalidInput
        }
        
        while var nextNode = operands.dequeue() {
            
            if nextNode.contains("*") {
                nextNode = nextNode.replacingOccurrences(of: "*", with: "-")
            }
            
            guard let rhs = Double(nextNode) else { throw CalculateError.invalidInput }
            guard let stringOperator = operators.dequeue(), let eachOperator = Operator(rawValue: stringOperator[stringOperator.startIndex]) else {
                throw CalculateError.invalidInput
            }

            middleResult = try eachOperator.calculate(lhs: middleResult, rhs: rhs)
       }
        return middleResult
    }
}

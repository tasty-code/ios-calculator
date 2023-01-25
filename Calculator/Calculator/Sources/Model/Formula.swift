//
//  Formula.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/25.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    func result() throws -> Double {
        guard let firstHead = operands.dequeue(), var middleResult = Double(firstHead) else {
            // 숫자를 뽑아서, Double 변환이 안된다면 그건 잘못된 input
            throw CalculateError.invalidInput
        }

        try (0...operands.count()).forEach { _ in
            guard let nextNode = operands.dequeue(), let rhs = Double(nextNode) else {
                throw CalculateError.invalidInput
            }
            guard let stringOperator = operators.dequeue(), let eachOperator = Operator(rawValue: stringOperator[stringOperator.startIndex]) else {
                // 연산자 뽑아서, 연산자 변환 안된다면 잘못된 input
                throw CalculateError.invalidInput
            }

            middleResult = try eachOperator.calculate(lhs: middleResult, rhs: rhs)
        }
        print(middleResult)
        return middleResult
    }
}

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
            // 숫자를 뽑아서, Double 변환이 안된다면 그건 잘못된 input
            throw CalculateError.invalidInput
        }
        
        // +/- 부호 바꾸기
        if firstHead.contains("*") {
            firstHead = firstHead.replacingOccurrences(of: "*", with: "-")
        }
        
        guard var middleResult = Double(firstHead) else {
            throw CalculateError.invalidInput
        }
        
        // 원래 0...operands.count()로 돌리면 5만 입력했을 경우 error 발생
        // 0..<operands.count()로 돌리면 5만 입력했을 경우 middleResult가 5가 되고, operands.count()가 0 으로 아래 forEach문 돌지 X
        try (0..<operands.count()).forEach { count in
            guard var nextNode = operands.dequeue() else {
                throw CalculateError.invalidInput
            }
            
            // +/- 부호 바꾸기
            if nextNode.contains("*") {
                nextNode = nextNode.replacingOccurrences(of: "*", with: "-")
            }

            guard let rhs = Double(nextNode) else { throw CalculateError.invalidInput }
            
            guard let stringOperator = operators.dequeue(), let eachOperator = Operator(rawValue: stringOperator[stringOperator.startIndex]) else {
                // 연산자 뽑아서, 연산자 변환 안된다면 잘못된 input
                throw CalculateError.invalidInput
            }

            middleResult = try eachOperator.calculate(lhs: middleResult, rhs: rhs)
        }
        print("결과는: \(middleResult)")
        return middleResult
    }
}

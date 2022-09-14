//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김유진 on 2022/09/13.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let splitedInput = input.split(with: " ")
        
        var operands = CalculatorItemQueue<Double>()
        operands.enqueue([splitedInput[0], splitedInput[2]].map{ Double($0) ?? 0 })
        
        var operators = CalculatorItemQueue<Character>()
        operators.enqueue([splitedInput[1]].map{ Character($0) })
        
        return Formula(operands: operands, operators: operators)
    }
    
    // 어디에서 쓰이는 함수인지 잘 모르겠음
    private func componentsByOperators(from input: String) -> [String] {
        return [String]()
    }
}

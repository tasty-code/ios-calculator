//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 정재근 on 2022/09/14.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let formula = componentsByOperator(from: input)
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Character>()
        
        for i in 0..<formula.count {
            if i == 0 || i % 2 == 0 {
                operands.enqueue(Double(formula[i]) ?? 0)
            } else {
                operators.enqueue(Operator(rawValue: Character(formula[i]))?.rawValue ?? "n")
            }
        }
        return Formula(operands: operands, operators: operators)
    }
    
    private func componentsByOperator(from input: String) -> [String] {
            let operands: [String] = input.components(separatedBy: ["+", "-", "/", "*"])
            var operators: [String] = []
            var result: [String] = []
            var j = 0
            var h = 0
        
            for val in input {
                if !val.isNumber {
                    operators.append(String(val))
                }
            }

            for i in 0..<operands.count+operators.count {
                if i == 0 || i % 2 == 0 {
                    result.append(operands[h])
                    h += 1
                } else {
                    result.append(operators[j])
                    j += 1
                }
            }
        
            return result
    }
}

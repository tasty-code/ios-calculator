//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김용재 on 2023/01/17.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let operators = ["a", "s", "d", "m"]
        let separatedInputs = componentsByOperators(from: input)
        let operatorElements = separatedInputs.filter { operators.contains($0) }
        let operandElements = separatedInputs.filter { !operatorElements.contains($0) }
        return Formula(operands: operandElements, operators: operatorElements)
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: ",")
    }
}

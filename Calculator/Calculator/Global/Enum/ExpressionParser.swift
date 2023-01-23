//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김용재 on 2023/01/17.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        
        let separatedInputs = componentsByOperators(from: input)
        let operators = Operator.allCases.map { String($0.rawValue) }
        
        let operatorElements = separatedInputs.filter { operators.contains($0) }
        let operandElements = separatedInputs.filter { !operatorElements.contains($0) }
        
        let operandsList = operandElements.compactMap { Double($0) }
        let operatorsList = operatorElements.compactMap { Operator(rawValue: Character($0)) }
        
        return Formula(operandsList: operandsList, operatorsList: operatorsList)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: ",")
    }
}

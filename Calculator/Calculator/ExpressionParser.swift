//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김용재 on 2023/01/17.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operators = Operator.allCases.compactMap { String($0.rawValue) }
        let separatedInputs = componentsByOperators(from: input)
        
        let operatorElements = separatedInputs.filter { operators.contains($0) }
        let operandElements = separatedInputs.filter { !operatorElements.contains($0) }
        
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        operandsQueue.elements = operandElements.compactMap { Double($0) }
        operatorsQueue.elements = operatorElements.compactMap { Operator(rawValue: Character($0)) }
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: ",")
    }
}

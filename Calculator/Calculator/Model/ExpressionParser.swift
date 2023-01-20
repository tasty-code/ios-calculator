//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/17.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorElements = input.compactMap { Operator(rawValue: $0) }
        let operators = CalculatorItemQueue<Operator>(elements: operatorElements)

        let operandElements = componentsByOperaters(from: input).compactMap { Double($0) }
        let operands = CalculatorItemQueue<Double>(elements: operandElements)

        return Formula(operands: operands, operators: operators)
    }

    private static func componentsByOperaters(from input: String) -> [String] {
        return Operator.allCases.reduce([input]) { partialResult, calculatorOperator in
            partialResult.flatMap {
                $0.split(with: calculatorOperator.rawValue)
            }
        }
    }
}

//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/19.
//

import Foundation

enum ExpressionParser {
    public static func parse(from input: String) -> Formula {
        let operatorElements = input.compactMap { Operator(rawValue: $0)}
        let operators = CalculatorItemQueue<Operator>(queue: operatorElements)
        
        let operandElements = componentsByOperaters(from: input).compactMap { Double($0)}
        let operands = CalculatorItemQueue<Double>(queue: operandElements)
        
        return Formula(operands: operands, operators: operators)
    }

    private static func componentsByOperaters(from input: String) -> [String] {
        return Operator.allCases.reduce([input]) { partialResult, Operator in
            partialResult.flatMap { $0.split(with: Operator.rawValue)
            }
        }
    }
}

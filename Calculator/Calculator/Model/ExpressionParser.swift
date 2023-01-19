//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/17.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operators = CalculatorItemQueue<Operator>()
        var operands = CalculatorItemQueue<Double>()
        
        input.map { Operator(rawValue: $0) }
            .compactMap { $0 }
            .forEach { operators.enqueue($0) }

        componentsByOperaters(from: input)
            .compactMap { Double($0) }
            .forEach { operands.enqueue($0) }

        return Formula(operands: CalculatorItemQueue<Double>(), operators: operators)
    }

    private static func componentsByOperaters(from input: String) -> [String] {
        return []
    }
}

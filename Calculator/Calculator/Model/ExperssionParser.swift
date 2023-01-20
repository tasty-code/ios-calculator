//
//  ExperssionParser.swift
//  Calculator
//
//  Created by Bora Yang on 2023/01/20.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operators = CalculatorItemQueue<Operator>()
        input.compactMap { Operator(rawValue: $0) }
             .forEach { operators.enqueue(item: $0) }

        var operands = CalculatorItemQueue<Double>()
        componentsByOperators(from: input)
            .forEach { operands.enqueue(item: Double($0) ?? 0) }

        return Formula(operands: operands, operators: operators)
    }
    private static func componentsByOperators(from input: String) -> [String] {
        input.components(separatedBy: ["+", "−", "÷", "×"])
    }
}

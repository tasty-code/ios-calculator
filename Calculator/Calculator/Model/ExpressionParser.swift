//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/17.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    private func componentsByOperaters(from input: String) -> [String] {
        return []
    }
}

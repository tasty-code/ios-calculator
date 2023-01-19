//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/17.
//

import Foundation

enum ExpressionParser<Element: CalculateItem> {
    func parse(from input: String) -> Formula<Element> {
        return Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
    }

    private func componentsByOperaters(from input: String) -> [String] {
        return []
    }
}

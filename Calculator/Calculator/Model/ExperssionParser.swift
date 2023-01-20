//
//  ExperssionParser.swift
//  Calculator
//
//  Created by Bora Yang on 2023/01/20.
//

import Foundation

enum ExpressionParser {
    private static func componentsByOperators(from input: String) -> [String] {
        input.components(separatedBy: ["+", "−", "÷", "×"])
    }
}

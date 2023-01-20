//
//  ExpressionParser.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/18.
//

import Foundation

enum ExpressionParser {
    public static func parse(from: String) -> Formula {

        return Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }
    
    private static func componentsByOperators(from input: CalculatorItem) -> [String] {
        return [String]()
    }
}

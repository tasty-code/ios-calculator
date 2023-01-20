//
//  ExpressionParser.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/18.
//

import Foundation

enum ExpressionParser {
    public static func parse(from: String) -> Formula {
        return Formula(operands: CalculatorItemQueue(linkedList: Double), operators: CalculatorItemQueue(linkedList: Operator.add))
    }
    
    private static func componentsByOperators(from input: CalculatorItem) -> [String] {
        return [String]()
    }
}

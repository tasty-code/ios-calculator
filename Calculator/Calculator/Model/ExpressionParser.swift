//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김유진 on 2022/09/13.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        return Formula(operands: input.split(with: " "), operators: <#T##CalculatorItemQueue#>)
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        
    }
}

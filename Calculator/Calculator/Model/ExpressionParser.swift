//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 정재근 on 2022/09/14.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        
    }
    
    private func componentsByOperator(from input: String) -> [String] {
        var operators: [String] = []
        for value in input {
            if !value.isNumber {
                operators.append(String(value))
            }
        }
        return operators
    }
}

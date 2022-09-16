//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 정재근 on 2022/09/14.
//

import Foundation
import UIKit

enum ExpressionParser {
    func parse(from input: String) throws -> Formula {
        let formula = componentsByOperator(from: input)
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator.RawValue>()
        
        for value in formula {
            if let doubleValue = Double(value) {
                operands.enqueue(doubleValue)
            } else {
                operators.enqueue(Character(value))
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private func componentsByOperator(from input: String) -> [String] {
        let splitedInput = input.split(with: " ")
        
        return splitedInput
    }
}

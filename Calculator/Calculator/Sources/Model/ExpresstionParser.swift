//
//  ExpresstionParser.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/25.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let parsedInput = componentsByOperators(from: input)
        let operands = CalculatorItemQueue()
        let operators = CalculatorItemQueue()
        
        for (index, value) in parsedInput.enumerated() {
            index % 2 == 0 ? operands.enqueue(data: value) : operators.enqueue(data: value)
        }
        
        let result = Formula(operands: operands, operators: operators)
        _ = result.result()
        return result
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { operatorCase in
            result = result.flatMap {
                $0.split(with: operatorCase.rawValue)
            }
        }
        return result
    }
}

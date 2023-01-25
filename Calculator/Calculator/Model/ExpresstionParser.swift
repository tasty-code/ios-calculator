//
//  ExpresstionParser.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/25.
//

import Foundation

enum ExpresstionParser {
    func parse(from input: String) -> Formula {
        return Formula()
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { operatorCase in
            result = result.flatMap {
                $0.split(with: operatorCase.rawValue)
            }
        }
        return result
    }
}

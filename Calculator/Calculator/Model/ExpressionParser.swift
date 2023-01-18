//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이상윤 on 2023/01/17.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        return Formula(operands: CalculateItemQueue(), operators: CalculateItemQueue())
    }
    
   static func componentsByOperators(from input: String) -> [String] {
        let operators: String = String(Operator.allCases.map { $0.rawValue })
        let operatorSet: CharacterSet = CharacterSet(charactersIn: operators)
        return input.components(separatedBy: operatorSet)
    }
}

struct Formula {
    var operands: CalculateItemQueue<Double>
    var operators: CalculateItemQueue<Operator>

    func result() -> Double {
        return Double()
    }
}

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}

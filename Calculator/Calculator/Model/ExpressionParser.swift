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

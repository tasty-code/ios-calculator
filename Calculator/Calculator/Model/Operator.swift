//
//  Operator.swift
//  Calculator
//
//  Created by 박도원 on 2022/09/05.
//

import Foundation

enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case minus = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return lhs + rhs
        case .minus:
            return lhs - rhs
        case .divide:
            return lhs / rhs
        case .multiply:
            return lhs * rhs
        }
    }
}

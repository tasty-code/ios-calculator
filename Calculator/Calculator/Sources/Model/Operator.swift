//
//  Operator.swift
//  Calculator
//
//  Created by 신동오 on 2023/01/17.
//

import Foundation

enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rhs: Double) throws -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .substract:
            return substract(lhs: lhs, rhs: rhs)
        case .divide:
            // 계산기 해보면, 0 / 5 = 0. 하지만 5 / 0 = 오류
            if rhs == 0 {
                throw CalculateError.zeroDivide
            } else {
                return divide(lhs: lhs, rhs: rhs)
            }
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    private func substract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}

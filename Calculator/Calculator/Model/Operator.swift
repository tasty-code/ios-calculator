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
            return add(lhs: lhs, rhs: rhs)
        case .minus:
            return minus(lhs: lhs, rhs: rhs)
        case .divide:
            do {
                return try divide(lhs: lhs, rhs: rhs)
            } catch {
                print(error.localizedDescription)
                return 0
            }
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    private func minus(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0 || lhs == 0 {
            throw CalculatorError.divisionZero
        }
        return lhs / rhs
    }
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    
}

//
//  CalculateItem.swift
//  Calculator
//
//  Created by 이상윤 on 2023/01/16.
//

import Foundation

protocol CalculateItem {

}

enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"

    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }

    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }

    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }

    private func divide(lhs: Double, rhs: Double) -> Double {
        guard rhs != .zero else {
            return .nan
        }
        return lhs / rhs
    }

    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}

extension Double: CalculateItem {

}

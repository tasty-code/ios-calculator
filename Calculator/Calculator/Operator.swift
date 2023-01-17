//
//  Operator.swift
//  Calculator
//
//  Created by 김용재 on 2023/01/17.
//

import Foundation

enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "%"
    case multiply = "x"
    
    func calculate(lhs: Double, rhs: Double) -> Double {}
    private func add(lhs: Double, rhs: Double) -> Double {}
    private func substract(lhs: Double, rhs: Double) -> Double {}
    private func divide(lhs: Double, rhs: Double) -> Double {}
    private func multiply(lhs: Double, rhs: Double) -> Double {}
}

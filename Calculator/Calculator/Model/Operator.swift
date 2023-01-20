//
//  Operator.swift
//  Calculator
//
//  Created by KimChoonSik on 2023/01/17.
//

import Foundation


enum Operator: String, CalculateItem {
    case calculate = "="
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"

    public func calculate(previousData: Double, nextData: Double) -> Double {
        return previousData + nextData
    }
    private func add(previousData: Double, nextData: Double) -> Double {
        return previousData + nextData
    }
    private func substract(previousData: Double, nextData: Double) -> Double {
        return previousData - nextData
    }
    private func divide(previousData: Double, nextData: Double) -> Double {
        return previousData / nextData
    }
    private func mulitiply(previousData: Double, nextData: Double) -> Double {
        return previousData * nextData
    }
}


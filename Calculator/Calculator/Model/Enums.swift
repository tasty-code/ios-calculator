//
//  Enums.swift
//  Calculator
//
//  Created by 이상윤 on 2023/01/16.
//

import Foundation

enum Operator: Character, CalculateItem, CaseIterable {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
}

//
//  CalculatorError.swift
//  Calculator
//
//  Created by 김보미 on 2023/01/20.
//

import Foundation

enum CalculatorError: LocalizedError {
    case divideByZero
    case notMatchingCountOfOperatorsAndOperands
    case invalidDequeue

    var errorDescription: String? {
        switch self {
        case .divideByZero:
            return "NaN"
        case .notMatchingCountOfOperatorsAndOperands:
            return "피연산자와 연산자의 개수가 잘못되었습니다."
        case .invalidDequeue:
            return "연산할 요소가 존재하지 않습니다."
        }
    }
}

//
//  Error.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/25.
//

import Foundation

enum CalculateError: Error {
    // 빈 input 들어오는 경우
    case nothingInput
    // 예상치 못한 Input 들어오는 경우
    case invalidInput
    // 0으로 나눌때
    case zeroDivide
}

extension CalculateError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .nothingInput:
            return nil
        case .invalidInput:
            return "Error"
        case .zeroDivide:
            return "NaN"
        }
    }
}

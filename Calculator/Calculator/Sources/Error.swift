//
//  Error.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/25.
//

import Foundation

enum CalculateError: Error {
    case nothingInput
    case invalidInput
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

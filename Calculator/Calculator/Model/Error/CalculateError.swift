//
//  Error.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/25.
//

import Foundation

enum CalculateError: Error {
    case unavailableDequeue
    case operandOperatorCountNotMatching
    case zeroDivideError
}

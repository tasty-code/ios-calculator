//
//  CalculatorError.swift
//  Calculator
//
//  Created by 정재근 on 2022/09/14.
//

import Foundation

enum CalculatorError: Error, LocalizedError {
    case typeConversionFailure
    case divisionZero
    case calculateFailure
    
    var errorDescription: String {
        switch self {
        case .typeConversionFailure:
            return "형 변환 실패"
        case .divisionZero:
            return "NaN"
        case .calculateFailure:
            return "계산 실패"
        }
    }
}

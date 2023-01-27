//
//  String+Extensions.swift
//  Calculator
//
//  Created by 김보미 on 2023/01/18.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }

    var isZero: Bool {
        allSatisfy ({ $0 == .dot || $0 == .zero })
    }

    static let zero = "0"
    static let dot = "."
    static let NaN = "NaN"
    static let dash = "-"
    static let doubleZero = "00"
    static let zeroDot = "0."
}

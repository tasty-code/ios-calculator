//
//  TemporaryInput.swift
//  Calculator
//
//  Created by Bora Yang on 2023/01/20.
//

import Foundation

struct TemporaryInput {
    private var partialOperator: Character = "+"
    private var partailOperands: [String] = []
    private var isPositive: Bool = true

    func partailOperandsIsEmpty() -> Bool {
        partailOperands.isEmpty
    }

    mutating func changeOperator(to newOperator: Character) {
        partialOperator = newOperator
    }

    mutating func addOperand(newNumber: String) {
        partailOperands.append(newNumber)
    }

    mutating func toggleSignValue() {
        isPositive = isPositive ? false : true
    }

    func makePair() -> String {
        let signValue = isPositive ? "" : "-"
        let numbers = partailOperands.joined()
        return "\(partialOperator)\(signValue)\(numbers)"
    }
}

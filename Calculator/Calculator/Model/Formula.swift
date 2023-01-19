//
//  Formula.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/17.
//

import Foundation

struct Formula {
    private var operands: CalculatorItemQueue<Double>
    private var operators: CalculatorItemQueue<Operator>

    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }

    func result() -> Double {
        

        return 0.0
    }
}

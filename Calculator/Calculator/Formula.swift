//
//  Formula.swift
//  Calculator
//
//  Created by 김용재 on 2023/01/17.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        return 0.0
    }
}

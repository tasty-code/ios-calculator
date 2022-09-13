//
//  Formula.swift
//  Calculator
//
//  Created by 박도원 on 2022/09/13.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<String>?
    var operators: CalculatorItemQueue<Double>?
    
    func result() -> Double {
        return 0
    }
}

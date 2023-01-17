//
//  Formula.swift
//  Calculator
//
//  Created by Mason Kim on 2023/01/17.
//

import Foundation

struct Formula<Element: CalculateItem> {
    var operands: CalculatorItemQueue<Element>
    var operators: CalculatorItemQueue<Element>
    
    func result() -> Double {
        return 0.0
    }
}

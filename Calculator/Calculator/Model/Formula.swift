//
//  Formula.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/18.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        guard let head = operands.getHead() else { return 0.0 }
        if head.next == nil {
            return head.data
        }
        return Double()
    }
}

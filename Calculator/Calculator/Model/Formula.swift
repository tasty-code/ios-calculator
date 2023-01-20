//
//  Formula.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/18.
//

import Foundation

struct Formula {
    public let operands: CalculatorItemQueue<Double>
    public let operators: CalculatorItemQueue<Operator>
    
    public func result() -> Double {
        return Double()
    }
}

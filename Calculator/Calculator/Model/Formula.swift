//
//  Formula.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/19.
//

import Foundation

struct Formula<T> {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
}

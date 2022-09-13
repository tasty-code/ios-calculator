//
//  Formula.swift
//  Calculator
//
//  Created by 김유진 on 2022/09/13.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Character>
    
    func result() -> Double {
        return Double()
    }
}

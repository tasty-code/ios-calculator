//
//  Operator.swift
//  Calculator
//
//  Created by KimChoonSik on 2023/01/17.
//

import Foundation


enum Operation: CalculateItem {

    case add
    case subtract
    case divide
    case multiply

    func calculate(previousData: Double, nextData: Double) -> Double {
        return 1
    }
    
    func add(previousData: Double, nextData: Double) -> Double {
        return previousData + nextData
    }
    
    func substract(previousData: Double, nextData: Double) -> Double {
        return previousData - nextData
    }
    
    func divide(previousData: Double, nextData: Double) -> Double {
        return previousData / nextData
    }
    
    func mulitiply(previousData: Double, nextData: Double) -> Double {
        return previousData * nextData
    }
}


let a = Operation.add

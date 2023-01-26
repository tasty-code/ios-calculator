//
//  ExpressionParser.swift
//  Calculator
//
//  Created by DONGWOOK SEO on 2023/01/18.
//

import Foundation

enum ExpressionParser {
    public static func parse(from: String) -> Formula {
        let input = from
        
        let inputedOperators = input.compactMap{Operator(rawValue:$0)}
        let inputedNumber = componentsByOperators(from: from).map{Double($0) ?? 0.0}
        
        var operatorsQueue = CalculatorItemQueue<Operator>()
        var numberQueue = CalculatorItemQueue<Double>()
                
        inputedOperators.forEach{operatorsQueue.enqueue(element: $0)}
        inputedNumber.forEach{numberQueue.enqueue(element: $0)}
        
        return Formula(operands: numberQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let result = input.components(separatedBy:["+","-","/","*"])
        return result
    }
}

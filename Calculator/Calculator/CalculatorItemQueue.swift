//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Lim Chae Yoon on 2022/09/06.
//

import Foundation

class CalculatorItemQueue: CalculatorItem {
    var numbers: Queue<Double> = Queue<Double>()
    var operators: Queue<Character> = Queue<Character>()
    
    func getCalculatorItems() -> (Queue<Double>, Queue<Character>) {
        return (numbers, operators)
    }
}

protocol CalculatorItem {
    
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 천승희 on 2022/09/06.
//

import Foundation

protocol CalculateItem {
    private var itemStorage: [Int] { get }
    
    func appendItem(item: Int) -> Void
}

struct CalculatorItemQueue: CalculatorItem {
    private var itemStorage: [Int] = []
}

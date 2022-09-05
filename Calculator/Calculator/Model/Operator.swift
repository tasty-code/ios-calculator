//
//  Operator.swift
//  Calculator
//
//  Created by 박도원 on 2022/09/05.
//

import Foundation

enum Operator: String {
    case add = "+"
    case minus = "-"
    case multiple = "*"
    case divison = "/"
    
    var value: String {
        return self.rawValue
    }
}


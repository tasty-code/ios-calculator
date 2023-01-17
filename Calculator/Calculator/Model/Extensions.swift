//
//  Extensions.swift
//  Calculator
//
//  Created by 이상윤 on 2023/01/17.
//

import Foundation

extension Double: CalculateItem {
    
}

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}

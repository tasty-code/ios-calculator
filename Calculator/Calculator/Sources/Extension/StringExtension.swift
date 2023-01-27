//
//  StringExtension.swift
//  Calculator
//
//  Created by 신동오 on 2023/01/25.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let changedString = self.replacingOccurrences(of: target.description, with: " \(target.description) ")
        let result = changedString.components(separatedBy: " ")
        return result
    }
}

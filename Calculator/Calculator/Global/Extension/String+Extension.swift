//
//  String+Extension.swift
//  Calculator
//
//  Created by 김용재 on 2023/01/17.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}

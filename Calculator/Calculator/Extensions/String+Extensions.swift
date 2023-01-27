//
//  String+Extensions.swift
//  Calculator
//
//  Created by 김보미 on 2023/01/18.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}

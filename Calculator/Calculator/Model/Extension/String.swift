//
//  String.swift
//  Calculator
//
//  Created by 조용현 on 2023/01/19.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}

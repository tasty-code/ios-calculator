//
//  String+.swift
//  Calculator
//
//  Created by Bora Yang on 2023/01/20.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { String($0) }
    }
}

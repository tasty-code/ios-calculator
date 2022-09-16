//
//  String+Extension.swift
//  Calculator
//
//  Created by 정재근 on 2022/09/13.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}


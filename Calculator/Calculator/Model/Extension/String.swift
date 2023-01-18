//
//  String.swift
//  Calculator
//
//  Created by Jason on 2023/01/18.
//

import Foundation

extension String {
    public func split(with target: Character) -> [String] {
        var receivedString = self
        var splitedString = receivedString.split(separator: target).map { substring in
            let convertToString = String(substring)
            return convertToString
        }
        return splitedString
    }
}

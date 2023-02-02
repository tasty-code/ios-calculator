//
//  UIStackView+Extension.swift
//  Calculator
//
//  Created by 박재우 on 2023/02/02.
//

import UIKit

extension UIStackView {
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}

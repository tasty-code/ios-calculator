//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var calculationFormula: String = "+"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addNumber(_ sender: UIButton) {
        guard let number = sender.currentTitle else {
            return
        }
        guard !isOperator() || (number != "0" && number != "00") else {
            return
        }
        calculationFormula += number
    }

    @IBAction func addOperator(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {
            return
        }
        guard isNumber() else {
            return
        }
    }

    func isOperator() -> Bool {
        var result = false
        for `operator` in Operator.allCases {
            guard calculationFormula.hasSuffix(String(`operator`.rawValue)) else {
                continue
            }
            result = true
        }
        return result
    }

    func isNumber() -> Bool {
        guard let lastElement = calculationFormula.last, lastElement.isNumber else {
            return false
        }
        return true
    }
}


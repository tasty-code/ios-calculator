//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var calculationFormula: String = "+"
    var isDecimal = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!

    @IBAction func allClear(_ sender: UIButton) {
        operandLabel.text?.removeAll()
        operandLabel.text = "0"
        isDecimal = false
    }

    @IBAction func clearEntry(_ sender: UIButton) {
        guard var enteredOperand = operandLabel.text, enteredOperand != "0" else {
            return
        }
        if enteredOperand.removeLast() == "." {
            isDecimal = false
        }
        guard enteredOperand.isEmpty == false else {
            operandLabel.text = "0"
            return
        }
        operandLabel.text = enteredOperand
    }

    @IBAction func addDecimalPoint(_ sender: UIButton) {
        guard let enteredOperand = operandLabel.text, isDecimal == false else {
            return
        }
        operandLabel.text = enteredOperand + "."
        isDecimal = true
    }

    @IBAction func addNumber(_ sender: UIButton) {
        guard let number = sender.currentTitle, let enteredOperand = operandLabel.text else {
            return
        }
        guard enteredOperand != "0" || (number != "0" && number != "00") else {
            return
        }
        if enteredOperand == "0" {
            operandLabel.text = number
        } else {
            operandLabel.text = enteredOperand + number
        }
    }

    @IBAction func addOperator(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {
            return
        }
    }
}


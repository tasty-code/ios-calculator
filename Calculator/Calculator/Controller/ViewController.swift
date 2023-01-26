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
    @IBOutlet weak var formulaStackViews: UIStackView!

    @IBAction func allClear(_ sender: UIButton) {
        operandLabel.text?.removeAll()
        operandLabel.text = "0"
        operatorLabel.text = ""
        isDecimal = false
        calculationFormula = "+"
    }

    @IBAction func clearEntry(_ sender: UIButton) {
        guard var enteredOperand = operandLabel.text, enteredOperand != "0" else {
            return
        }
        guard enteredOperand != String(Double.nan) else {
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

    @IBAction func changeSign(_ sender: UIButton) {
        guard let enteredOperand = operandLabel.text, enteredOperand != "0" else {
            return
        }
        if enteredOperand.first == "-" {
            operandLabel.text?.removeFirst()
        } else {
            operandLabel.text = "-" + enteredOperand
        }
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
        guard let `operator` = sender.currentTitle,
              let enteredOperator = operatorLabel.text,
              var enteredOperand = operandLabel.text else {
            return
        }
        guard enteredOperand != "0" else {
            if calculationFormula == "+" {
                calculationFormula.removeAll()
            }
            operatorLabel.text = `operator`
            return
        }
        if enteredOperand.hasSuffix(".") {
            enteredOperand += "0"
        }
        calculationFormula += enteredOperator + enteredOperand
        addFormulaStackView(operator: enteredOperator, operand: enteredOperand)
        operatorLabel.text = `operator`
        operandLabel.text = "0"
        isDecimal = false
    }

    @IBAction func calculateResult(_ sender: UIButton) {
        guard let enteredOperator = operatorLabel.text,
              var enteredOperand = operandLabel.text else {
            return
        }
        calculationFormula += enteredOperator + enteredOperand
        operatorLabel.text = ""
        isDecimal = false
        var formula = ExpressionParser.parse(from: calculationFormula)
        operandLabel.text = String(formula.result())

        calculationFormula = "+"
    }

    private func addFormulaStackView(`operator`: String, operand: String) {
        let formulaStackView = UIStackView()
        let enteredOperatorLabel = UILabel()
        let enteredOperandLabel = UILabel()

        enteredOperandLabel.text = operand
        enteredOperatorLabel.text = `operator`
        enteredOperandLabel.textColor = .white
        enteredOperatorLabel.textColor = .white
        formulaStackView.axis = .horizontal
        formulaStackView.spacing = 8
        formulaStackView.addArrangedSubview(enteredOperatorLabel)
        formulaStackView.addArrangedSubview(enteredOperandLabel)

        formulaStackViews.addArrangedSubview(formulaStackView)
    }
}


//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var calculationFormula: String = "+"
    var isDecimal: Bool = false
    var enteredOperand: String = "0"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var formulaStackViews: UIStackView!

    @IBAction func allClear(_ sender: UIButton) {
        operandLabel.text?.removeAll()
        isDecimal = false
        operatorLabel.text = ""
        calculationFormula = "+"
        enteredOperand = "0"
        operandLabel.text = enteredOperand

        formulaStackViews.removeAllArrangedSubviews()
    }

    @IBAction func clearEntry(_ sender: UIButton) {
        guard enteredOperand != "0", enteredOperand != String(Double.nan) else {
            return
        }
        if enteredOperand.removeLast() == "." {
            isDecimal = false
        }
        if enteredOperand.isEmpty {
            enteredOperand = "0"
        }
        operandLabel.text = enteredOperand
    }

    @IBAction func changeSign(_ sender: UIButton) {
        guard enteredOperand != "0" else {
            return
        }
        if enteredOperand.first == "-" {
            enteredOperand.removeFirst()
        } else {
            enteredOperand = "-" + enteredOperand
        }
        operandLabel.text = enteredOperand
    }

    @IBAction func addDecimalPoint(_ sender: UIButton) {
        guard isDecimal == false else {
            return
        }
        enteredOperand += "."
        isDecimal = true
        operandLabel.text = enteredOperand
    }

    @IBAction func addNumber(_ sender: UIButton) {
        guard let number = sender.currentTitle else {
            return
        }
        guard enteredOperand != "0" || (number != "0" && number != "00") else {
            return
        }
        if enteredOperand == "0" {
            enteredOperand = number
        } else {
            enteredOperand += number
        }
        operandLabel.text = enteredOperand
    }

    @IBAction func addOperator(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle,
              let enteredOperator = operatorLabel.text else {
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
        enteredOperand = "0"
        operandLabel.text = enteredOperand
        isDecimal = false
        scrollView.contentOffset.y = scrollView.contentSize.height
    }

    @IBAction func calculateResult(_ sender: UIButton) {
        guard let enteredOperator = operatorLabel.text else {
            return
        }
        calculationFormula += enteredOperator + enteredOperand
        operatorLabel.text = ""
        isDecimal = false
        var formula = ExpressionParser.parse(from: calculationFormula)
        var resultValue = String(formula.result())
        if resultValue.hasSuffix(".0") {
            resultValue.removeLast()
            resultValue.removeLast()
        }
        enteredOperand = resultValue
        operandLabel.text = enteredOperand
        addFormulaStackView(operator: enteredOperator, operand: enteredOperand)

        calculationFormula = "+"
        scrollView.contentOffset.y = scrollView.contentSize.height
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

extension UIStackView {
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}

//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var calculationFormula: String = "+"
    private var isDecimal: Bool = false
    private var isCalculated: Bool = false
    private var enteredOperand: String = "0"
    private let point = "."

    override func viewDidLoad() {
        super.viewDidLoad()
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
        operandLabel.text = formattingNumber(enteredOperand)
        formulaStackViews.removeAllArrangedSubviews()
    }

    @IBAction func clearEntry(_ sender: UIButton) {
        guard isInitialOperand() == false, enteredOperand != String(Double.nan), isCalculated == false else {
            return
        }
        if enteredOperand.removeLast() == Character(point) {
            isDecimal = false
        }
        if enteredOperand.isEmpty {
            enteredOperand = "0"
        }
        operandLabel.text = formattingNumber(enteredOperand)
    }

    @IBAction func changeSign(_ sender: UIButton) {
        guard isInitialOperand() == false else {
            return
        }
        if enteredOperand.first == "-" {
            enteredOperand.removeFirst()
        } else {
            enteredOperand = "-" + enteredOperand
        }
        operandLabel.text = formattingNumber(enteredOperand)
    }

    @IBAction func addDecimalPoint(_ sender: UIButton) {
        guard isDecimal == false, isCalculated == false else {
            return
        }
        enteredOperand += point
        isDecimal = true
        operandLabel.text = formattingNumber(enteredOperand) + point
    }

    @IBAction func addOperand(_ sender: UIButton) {
        guard let number = sender.currentTitle else {
            return
        }
        if isCalculated {
            enteredOperand = "0"
            isCalculated = false
        }
        guard isInitialOperand() == false || (number != "0" && number != "00") else {
            return
        }
        if isInitialOperand() {
            enteredOperand = number
        } else {
            enteredOperand += number
        }
        operandLabel.text = convertOperand(enteredOperand)
    }

    @IBAction func addOperator(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle,
              let enteredOperator = operatorLabel.text else {
            return
        }
        guard isInitialOperand() == false else {
            if calculationFormula == "+" {
                calculationFormula.removeAll()
            }
            operatorLabel.text = `operator`
            return
        }
        if enteredOperand.hasSuffix(point) {
            enteredOperand += "0"
        }
        calculationFormula += enteredOperator + enteredOperand
        addFormulaStackView(operator: enteredOperator, operand: enteredOperand)
        operatorLabel.text = `operator`
        enteredOperand = "0"
        operandLabel.text = formattingNumber(enteredOperand)
        isDecimal = false
        scrollView.contentOffset.y = scrollView.contentSize.height
    }

    @IBAction func calculateResult(_ sender: UIButton) {
        guard let enteredOperator = operatorLabel.text, calculationFormula != "+" else {
            return
        }
        calculationFormula += enteredOperator + enteredOperand
        operatorLabel.text = ""
        isDecimal = false
        isCalculated = true
        var formula = ExpressionParser.parse(from: calculationFormula)
        addFormulaStackView(operator: enteredOperator, operand: enteredOperand)
        enteredOperand = String(formula.result())
        operandLabel.text = formattingNumber(enteredOperand)
        calculationFormula = "+"
        scrollView.contentOffset.y = scrollView.contentSize.height
    }

    private func addFormulaStackView(`operator`: String, operand: String) {
        let formulaStackView = UIStackView()
        let enteredOperatorLabel = UILabel()
        let enteredOperandLabel = UILabel()

        enteredOperandLabel.text = formattingNumber(operand)
        enteredOperatorLabel.text = `operator`
        enteredOperandLabel.textColor = .white
        enteredOperatorLabel.textColor = .white
        formulaStackView.axis = .horizontal
        formulaStackView.spacing = 8
        formulaStackView.addArrangedSubview(enteredOperatorLabel)
        formulaStackView.addArrangedSubview(enteredOperandLabel)

        formulaStackViews.addArrangedSubview(formulaStackView)
    }

    private func formattingNumber(_ number: String) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 20
        formatter.numberStyle = .decimal
        return formatter.string(for: Double(number)) ?? number
    }

    private func convertOperand(_ operand: String) -> String {
        if let indexOfPoint = operand.firstIndex(of: Character(point)) {
            let integerOfOperand = String(operand[operand.startIndex..<indexOfPoint])
            var decimalOfOperand: String
            if operand.distance(from: indexOfPoint, to: operand.endIndex) > 20 {
                let twentyIndex = operand.index(indexOfPoint, offsetBy: 20)
                decimalOfOperand = String(operand[indexOfPoint...twentyIndex])
            } else {
                decimalOfOperand = String(operand[indexOfPoint..<operand.endIndex])
            }
            return formattingNumber(integerOfOperand) + decimalOfOperand
        }
        return formattingNumber(operand)
    }

    private func isInitialOperand() -> Bool {
        return enteredOperand == "0"
    }
}

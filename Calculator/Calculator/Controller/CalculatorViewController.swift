//
//  Calculator - CalculatorViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var historyStackView: UIStackView!

    private var formulaString = ""
    private var isCalculated = false

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction private func tappedOperandButton(_ sender: UIButton) {
        if isCalculated {
            resetHistoryStackView()
            resetLabels()
            isCalculated = false
        }

        guard var operand = operandLabel.text else { return }
        guard let inputOperand = sender.titleLabel?.text else { return }

        if operand.contains(".") && inputOperand == "." {
            return
        }

        if (operand == "0" || operand == "-0") && (inputOperand == "0" || inputOperand == "00") {
            return
        }

        if (operand == "0" || operand == "-0") && 1...9 ~= (Int(inputOperand) ?? 0) {
            operand.remove(at: operand.firstIndex(of: "0") ?? operand.startIndex)
            operandLabel.text = operand + inputOperand
            return
        }

        operandLabel.text = operand + inputOperand
    }

    @IBAction private func tappedOperatorButton(_ sender: UIButton) {
        if isCalculated {
            resetHistoryStackView()
            isCalculated = false
        }

        guard let operand = operandLabel.text else { return }
        guard let inputOperator = sender.titleLabel?.text else { return }

        if operand == "0" || operand == "-0" || operand == "0." || operand == "-0."{
            operatorLabel.text = inputOperator
            return
        }

        formulaString += (operatorLabel.text ?? "") + (operandLabel.text ?? "")

        addHistoryLabels()

        operatorLabel.text = sender.titleLabel?.text
        operandLabel.text = "0"
        print(formulaString)
    }

    @IBAction private func tappedACButton(_ sender: UIButton) {
        resetLabels()
        resetHistoryStackView()

        formulaString = ""
    }

    @IBAction private func tappedCEButton(_ sender: UIButton) {
        operandLabel.text = "0"
    }

    @IBAction private func tappedSignChangeButton(_ sender: UIButton) {
        guard isCalculated == false else { return }

        guard var operand = operandLabel.text else {
            return
        }

        if operand.first == "-" {
            operand.removeFirst()
            operandLabel.text = String(operand)
        } else {
            operandLabel.text = "-\(operand)"
        }
    }

    @IBAction private func tappedResultButton(_ sender: UIButton) {
        formulaString += (operatorLabel.text ?? "") + (operandLabel.text ?? "")
        addHistoryLabels()

        var result = 0.0

        var fomula = ExpressionParser.parse(from: formulaString)
        do {
            result = try fomula.result()
        } catch {
            print(error.localizedDescription)
        }

        operandLabel.text = String(result)
        operatorLabel.text = ""

        formulaString = ""

        isCalculated = true
    }

    // MARK: - Helpers
    private func addHistoryLabels() {
        let historyOperatorLabel: UILabel = {
            let label = UILabel()
            label.text = operatorLabel.text
            label.font = .preferredFont(forTextStyle: .title3)
            label.textColor = .white
            return label
        }()

        let historyOperandLabel: UILabel = {
            let label = UILabel()
            label.text = operandLabel.text
            label.font = .preferredFont(forTextStyle: .title3)
            label.textColor = .white
            return label
        }()

        let stack = UIStackView(arrangedSubviews: [historyOperatorLabel, historyOperandLabel])
        stack.axis = .horizontal
        stack.spacing = 8
        historyStackView.addArrangedSubview(stack)
    }

    private func resetHistoryStackView() {
        historyStackView.arrangedSubviews
             .forEach { $0.removeFromSuperview() }
    }

    private func resetLabels() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
}

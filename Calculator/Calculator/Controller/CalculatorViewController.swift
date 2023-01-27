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

        guard var operand = operandLabel.text,
              let inputOperand = sender.titleLabel?.text,
              isValid(operand: &operand, withInputOperand: inputOperand) else { return }

        operandLabel.text = operand + inputOperand
    }

    @IBAction private func tappedOperatorButton(_ sender: UIButton) {
        guard let operand = operandLabel.text,
              let inputOperator = sender.titleLabel?.text,
              operand != .NaN else { return }

        if isCalculated {
            resetHistoryStackView()
            isCalculated = false
        }

        guard isValid(operator: inputOperator, withOperand: operand) else { return }

        updateFormulaString()
        addHistoryLabels()

        operatorLabel.text = sender.titleLabel?.text
        operandLabel.text = .zero
    }

    @IBAction private func tappedACButton(_ sender: UIButton) {
        resetLabels()
        resetHistoryStackView()

        formulaString = ""
    }

    @IBAction private func tappedCEButton(_ sender: UIButton) {
        operandLabel.text = .zero
    }

    @IBAction private func tappedSignChangeButton(_ sender: UIButton) {
        guard isCalculated == false,
              var operand = operandLabel.text,
              operand.allSatisfy ({ $0 == .dot || $0 == .zero }) == false else { return }

        if operand.first == .dash {
            operand.removeFirst()
            operandLabel.text = String(operand)
        } else {
            operandLabel.text = .dash + operand
        }
    }

    @IBAction private func tappedResultButton(_ sender: UIButton) {
        guard isCalculated == false else { return }

        updateFormulaString()
        addHistoryLabels()

        var formula = ExpressionParser.parse(from: formulaString)
        do {
            let result = try formula.result()
            operandLabel.text = String(result)
        } catch {
            operandLabel.text = error.localizedDescription
        }

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
        operandLabel.text = .zero
        operatorLabel.text = ""
    }

    private func updateFormulaString() {
        formulaString += (operatorLabel.text ?? "") + (operandLabel.text ?? "")
    }

    private func isValid(operand: inout String, withInputOperand inputOperand: String) -> Bool {
        if operand.contains(.dot) && inputOperand == .dot {
            return false
        }

        if operand == .zero && (inputOperand == .zero || inputOperand == .doubleZero) {
            return false
        }

        if operand == .zero && 1...9 ~= (Int(inputOperand) ?? 0) {
            operand.remove(at: operand.firstIndex(of: .zero) ?? operand.startIndex)
        }

        return true
    }

    private func isValid(operator: String, withOperand operand: String) -> Bool {
        if (operand == .zero || operand == .zeroDot) && formulaString.isEmpty == false {
            operatorLabel.text = `operator`
            return false
        }

        return true
    }
}

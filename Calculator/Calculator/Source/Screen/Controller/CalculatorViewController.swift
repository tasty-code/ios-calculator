//
//  Calculator - CalculatorViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
        
    @IBOutlet weak private var cumulativeCalculationScrollView: UIScrollView!
    @IBOutlet weak private var cumulativeCalculationStackView: UIStackView!
    @IBOutlet weak private var displayNumberLabel: UILabel!
    @IBOutlet weak private var displayOperatorLabel: UILabel!

    private var isCalculated: Bool = false
    private var computation = ""
    private let oneSpace = " "
    private let blankSpace = ""
    private let zeroArray = ["0", "00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func digitButtonTapped(_ sender: UIButton) {
        let inputButtonNumber = sender.currentTitle!
        
        guard isCalculated == false else {
            clearAllTheResult()
            if inputButtonNumber == "." {
                displayNumberLabel.text = "0."
            } else {
                displayNumberLabel.text = inputButtonNumber
            }
            return isCalculated = false
        }
        
        if displayNumberLabel.text == zeroArray[0] {
            guard inputButtonNumber != "." else {
                return displayNumberLabel.text = "0."
            }
            guard zeroArray.contains(inputButtonNumber) else {
                displayNumberLabel.text = inputButtonNumber
                return
            }
        } else {
            let currentDisplayNumber = displayNumberLabel.text ?? blankSpace
            let displayNumber = currentDisplayNumber + inputButtonNumber
            guard checkNumberOfDecimalPoint(of: displayNumber) else { return }
            displayNumberLabel.text = currentDisplayNumber + inputButtonNumber
        }
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard isCalculated == false else { return }
        
        addFormulaLabel()
        updateComputation()
        
        displayNumberLabel.text = zeroArray[0]
        displayOperatorLabel.text = sender.currentTitle!
    }
    
    @IBAction private func switchSignButtonTapped(_ sender: UIButton) {
        guard let displayNumberLabel = Double(displayNumberLabel.text ?? "0.0") else { return }
        self.displayNumberLabel.text = String(-displayNumberLabel)
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        displayNumberLabel.text = zeroArray[0]
    }
    
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        clearAllTheResult()
    }
    
    @IBAction private func equalButtonTapped(_ sender: UIButton) {
        guard isCalculated == false else { return }
        addFormulaLabel()
        updateComputation()
        var formula = ExpressionParser.parse(from: computation)
        let result = formula.result()
        
        if result == Double.infinity {
            displayNumberLabel.text = "NaN"
            displayOperatorLabel.text = blankSpace
        } else {
            displayNumberLabel.text = String(result)
            displayOperatorLabel.text = blankSpace
        }
        isCalculated = true
    }
    
    private func checkNumberOfDecimalPoint(of number: String) -> Bool {
        let numberCharacterArray = Array(number)
        let numberOfDecimalPoint = numberCharacterArray.filter { Character in
            Character == "."
        }.count
        guard numberOfDecimalPoint < 2 else { return false }
        return true
    }
    
    private func addFormulaLabel() {
        let previousCalculationLabel = UILabel()
        previousCalculationLabel.textColor = .white
        previousCalculationLabel.font = UIFont.systemFont(ofSize: 20)
        previousCalculationLabel.text = displayOperatorLabel.text! + oneSpace + displayNumberLabel.text!
        cumulativeCalculationStackView.addArrangedSubview(previousCalculationLabel)
        cumulativeCalculationScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: cumulativeCalculationScrollView.contentSize.height - cumulativeCalculationScrollView.bounds.size.height)
        cumulativeCalculationScrollView.setContentOffset(bottomOffset, animated: false)
    }
    
    private func updateComputation() {
        let pairOfOpeartorAndOperand = oneSpace + (displayOperatorLabel.text ?? blankSpace) + oneSpace + (displayNumberLabel.text ?? "0.0")
        computation = computation + pairOfOpeartorAndOperand
    }
    
    private func clearAllTheResult() {
        displayNumberLabel.text = zeroArray[0]
        displayOperatorLabel.text = blankSpace
        cumulativeCalculationStackView.subviews.forEach({ $0.removeFromSuperview() })
        computation = blankSpace
    }
}

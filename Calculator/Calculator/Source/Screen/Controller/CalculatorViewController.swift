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

    private var displayNumber: String {
        get {
            if let currentNumber = displayNumberLabel.text?.replacingOccurrences(of: ",", with: "") {
                return currentNumber
            }
            return ""
        }
        set {
            var input = newValue
            if input.count >= 19 {
                input = String(input.prefix(19))
            }
            
            if input.last! == "." {
                guard let numWithComma = makeNumberToStringWithComma(value: String(newValue.prefix(newValue.count - 1))) else {
                    displayNumberLabel.text = "연산 불가"
                    return
                }
                displayNumberLabel.text = numWithComma + "."
                return
            }
            guard let numWithComma = makeNumberToStringWithComma(value: input) else {
                displayNumberLabel.text = "연산 불가"
                return
            }
            displayNumberLabel.text = numWithComma
        }
    }
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
                displayNumber = "0."
            } else {
                displayNumber = inputButtonNumber
            }
            return isCalculated = false
        }
        
        if displayNumber == zeroArray[0] {
            guard inputButtonNumber != "." else {
                return displayNumber = "0."
            }
            guard zeroArray.contains(inputButtonNumber) else {
                displayNumber = inputButtonNumber
                return
            }
        } else {
            let currentDisplayNumber = displayNumber
            let number = currentDisplayNumber + inputButtonNumber
            guard checkNumberOfDecimalPoint(of: number) else { return }
            displayNumber = currentDisplayNumber + inputButtonNumber
        }
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard isCalculated == false else { return }
        
        addFormulaLabel()
        updateComputation()
        
        displayNumber = zeroArray[0]
        displayOperatorLabel.text = sender.currentTitle!
    }
    
    @IBAction private func switchSignButtonTapped(_ sender: UIButton) {
        guard let displayValue = Double(displayNumber) else { return }
        self.displayNumber = String(-displayValue)
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        displayNumber = zeroArray[0]
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
            displayNumber = "NaN"
            displayOperatorLabel.text = blankSpace
        } else {
            displayNumber = String(result)
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
        previousCalculationLabel.text = displayOperatorLabel.text! + oneSpace + (displayNumberLabel.text ?? "")
        cumulativeCalculationStackView.addArrangedSubview(previousCalculationLabel)
        cumulativeCalculationScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: cumulativeCalculationScrollView.contentSize.height - cumulativeCalculationScrollView.bounds.size.height)
        cumulativeCalculationScrollView.setContentOffset(bottomOffset, animated: false)
    }
    
    private func updateComputation() {
        let pairOfOpeartorAndOperand = oneSpace + (displayOperatorLabel.text ?? blankSpace) + oneSpace + displayNumber
        computation = computation + pairOfOpeartorAndOperand
    }
    
    private func clearAllTheResult() {
        displayNumber = zeroArray[0]
        displayOperatorLabel.text = blankSpace
        cumulativeCalculationStackView.subviews.forEach({ $0.removeFromSuperview() })
        computation = blankSpace
    }
    
    func makeNumberToStringWithComma(value: String) -> String? {
        guard let value = Double(value) else { return nil }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        
        var formattedNumber = "0"
        
        if floor(value) == value {
            let intValue = Int(value)
            formattedNumber = numberFormatter.string(from: NSNumber(value: intValue)) ?? "0"
        } else {
            formattedNumber = numberFormatter.string(from: NSNumber(value: value)) ?? "0"
        }
        return formattedNumber
    }
}

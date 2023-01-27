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
    
    var computation = ""
    var blankSpace = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func digitButtonTapped(_ sender: UIButton) {
        let inputButtonNumber = sender.currentTitle!
        let zeroArray = ["0", "00"]

        if displayNumberLabel.text == "0" {
            guard zeroArray.contains(inputButtonNumber) else {
                displayNumberLabel.text = inputButtonNumber
                return
            }
        } else {
            let currentDisplayNumber = displayNumberLabel.text ?? ""
            let displayNumber = currentDisplayNumber + inputButtonNumber
            guard checkNumberOfDecimalPoint(of: displayNumber) else { return }
            displayNumberLabel.text = currentDisplayNumber + inputButtonNumber
        }
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        addFormulaLabel()
        updateComputation()
        
        displayNumberLabel.text = "0"
        displayOperatorLabel.text = sender.currentTitle!
    }
    
    @IBAction private func switchSignButtonTapped(_ sender: UIButton) {
        guard let displayNumberLabel = Double(displayNumberLabel.text ?? "0.0") else { return }
        self.displayNumberLabel.text = String(-displayNumberLabel)
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        displayNumberLabel.text = "0"
    }
    
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        displayNumberLabel.text = "0"
        displayOperatorLabel.text = ""
        cumulativeCalculationStackView.subviews.forEach({ $0.removeFromSuperview() })
        computation = ""
    }
    
    @IBAction private func equalButtonTapped(_ sender: UIButton) {
        addFormulaLabel()
        updateComputation()
        var formula = ExpressionParser.parse(from: computation)
        let result = formula.result()
        displayNumberLabel.text = String(result)
        displayOperatorLabel.text = ""
        print(computation)
        print(result)
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
        previousCalculationLabel.text = displayOperatorLabel.text! + " " + displayNumberLabel.text!
        cumulativeCalculationStackView.addArrangedSubview(previousCalculationLabel)
        cumulativeCalculationScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: cumulativeCalculationScrollView.contentSize.height - cumulativeCalculationScrollView.bounds.size.height)
        cumulativeCalculationScrollView.setContentOffset(bottomOffset, animated: false)
    }
    
    private func updateComputation() {
        let pairofOperandOperand = blankSpace + (displayOperatorLabel.text ?? "") + blankSpace + (displayNumberLabel.text ?? "0.0")
        computation = computation + pairofOperandOperand
    }
}


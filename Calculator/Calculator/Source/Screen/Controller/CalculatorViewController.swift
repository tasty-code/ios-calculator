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
            let currentDisplayNumber = displayNumberLabel.text!
            displayNumberLabel.text = currentDisplayNumber + inputButtonNumber
        }
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        let previousCalculationLabel = UILabel()
        previousCalculationLabel.textColor = .white
        previousCalculationLabel.font = UIFont.systemFont(ofSize: 20)
        previousCalculationLabel.text = displayOperatorLabel.text! + " " + displayNumberLabel.text!
        cumulativeCalculationStackView.addArrangedSubview(previousCalculationLabel)
        cumulativeCalculationScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: cumulativeCalculationScrollView.contentSize.height - cumulativeCalculationScrollView.bounds.size.height)
        cumulativeCalculationScrollView.setContentOffset(bottomOffset, animated: false)
        
        displayNumberLabel.text = "0"
        displayOperatorLabel.text = sender.currentTitle!
    }
    
    @IBAction private func negativeButtonTapped(_ sender: UIButton) {
        print("negativeButtonTapped")
    }
    
    @IBAction private func clearButtonTapped(_ sender: UIButton) {
        displayNumberLabel.text = "0"
    }
    
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        displayNumberLabel.text = "0"
        displayOperatorLabel.text = ""
        cumulativeCalculationStackView.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    @IBAction private func equalButtonTapped(_ sender: UIButton) {
        print("equalButtonTapped")
    }
    
}


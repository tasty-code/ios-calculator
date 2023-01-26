//
//  Calculator - CalculatorViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
    private var userTyping: Bool = false
    
    @IBOutlet weak private var cumulativeCalculationScrollView: UIScrollView!
    @IBOutlet weak private var cumulativeCalculationStackView: UIStackView!
    @IBOutlet weak private var displayNumberLabel: UILabel!
    @IBOutlet weak private var displayOperatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func digitButtonTapped(_ sender: UIButton) {
        let currentTitle = sender.currentTitle!
        
        if userTyping {
            let currentDisplayNumber = displayNumberLabel.text!
            displayNumberLabel.text = currentDisplayNumber + currentTitle
        } else {
            displayNumberLabel.text = currentTitle
        }
        userTyping = true
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
        
        displayNumberLabel.text = ""
        displayOperatorLabel.text = sender.currentTitle!
    }
    
    @IBAction private func negativeButtonTapped(_ sender: UIButton) {
        print("negativeButtonTapped")
    }
    
    @IBAction private func clearButtonTapped(_ sender: UIButton) {
        print("clearButtonTapped")
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


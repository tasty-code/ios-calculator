//
//  Calculator - CalculatorViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
    private var userTyping: Bool = false
    
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var stackView: UIStackView!
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
        let label = UILabel()
        label.textColor = .white
        label.text = displayOperatorLabel.text! + " " + displayNumberLabel.text!
        
        scrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height)
        scrollView.setContentOffset(bottomOffset, animated: false)
        stackView.addArrangedSubview(label)
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
        stackView.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    @IBAction private func equalButtonTapped(_ sender: UIButton) {
        print("equalButtonTapped")
    }
    
}


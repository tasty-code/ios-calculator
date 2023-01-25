//
//  Calculator - CalculatorViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
    private var userTyping: Bool = false
    
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
        displayOperatorLabel.text = sender.currentTitle!
    }
    
    @IBAction func negativeButtonTapped(_ sender: UIButton) {
        print("negativeButtonTapped")
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        print("clearButtonTapped")
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        print("allClearButtonTapped")
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        print("equalButtonTapped")
    }
    
}


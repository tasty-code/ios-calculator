//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var userOperandInput = "" {
        willSet {
            operandLabel.text = newValue
        }
    }
    var userOperatorInput = "" {
        willSet {
            operatorLabel.text = newValue
        }
    }
    
    var totalInput = ""
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .halfUp
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        return numberFormatter
    }()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var numberTotalStackView: UIStackView!
    @IBOutlet weak var numberInnerStackView: CustomStackView!
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - setup
    
    private func addNumberTotalStackView(operatorText: String, operandText: String) {
        let numberStackView: CustomStackView = {
            let sv = CustomStackView(frame: .zero)
            sv.operatorLabel.text = operatorText
            sv.operandLabel.text = operandText
            return sv
        }()
        numberTotalStackView.addArrangedSubview(numberStackView)
        moveToPoint(labelHeight: numberStackView.operandLabel.intrinsicContentSize.height)
    }
    
    private func moveToPoint(labelHeight: CGFloat) {
        var bottomOffset = CGPoint(x: 0, y: 0)
        
        if scrollView.contentSize.height > scrollView.visibleSize.height {
            bottomOffset.y = scrollView.contentSize.height - scrollView.visibleSize.height + labelHeight
        }
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func removeAllTotalStackView() {
        numberTotalStackView.arrangedSubviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        totalInput = ""
        userOperandInput = "0"
        userOperatorInput = ""
    }
    
    // MARK: - Action
    
    @IBAction func operandsButtonTapped(_ sender: UIButton) {
        guard let operands = sender.currentTitle else { return }
        
        if userOperandInput == "0" {
            userOperandInput = ""
        }
        userOperandInput += operands
    }
    
    @IBAction func operatorsButtonTapped(_ sender: UIButton) {
        guard let operators = sender.currentTitle else { return }
        
        if userOperandInput != "0" && !userOperandInput.isEmpty {
            addNumberTotalStackView(operatorText: userOperatorInput, operandText: userOperandInput)
            
            totalInput += (userOperatorInput + userOperandInput)
            userOperandInput = "0"
        }
        
        userOperatorInput = operators
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard !userOperandInput.isEmpty else { return }
        
        addNumberTotalStackView(operatorText: userOperatorInput, operandText: userOperandInput)
        totalInput += (userOperatorInput + userOperandInput)
        userOperandInput = ""
        
        do {
            guard let result = try ExpresstionParser.parse(from: totalInput)?.result() else { return }
            guard let resultFormatted = numberFormatter.string(for: result) else { return }
            operandLabel.text = resultFormatted
        } catch {
            operandLabel.text = error.localizedDescription
        }
        userOperatorInput = ""
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
        removeAllTotalStackView()
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        userOperandInput = "0"
    }
    
    @IBAction func plusminusButtonTapped(_ sender: UIButton) {
        if userOperandInput != "0" {
            userOperandInput = userOperandInput.contains("-") ? userOperandInput.trimmingCharacters(in: ["-"]) : "-\(userOperandInput)"
        }
    }
}




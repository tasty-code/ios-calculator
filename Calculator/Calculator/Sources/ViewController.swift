//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var userOperandInput = "0" {
        willSet {
            operandLabel.text = newValue
            print("operandLabel 변경: \(newValue)")
        }
    }
    var userOperatorInput = "" {
        willSet {
            operatorLabel.text = newValue
            print("operatorLabel 변경: \(newValue)")
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
        // textLabel 생성시 scrollView 화면이동 기능
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
        
        // CE 누르고 다시 숫자 입력할경우 023 이런식으로 입력. 이거 아래 코드 말고, 아예 0 올수 없도록 코드 리팩토링 하기
        if userOperandInput == "0" {
            userOperandInput = ""
        }
        userOperandInput += operands
        print("operandsButtonTapped의 userOperandInput: \(userOperandInput)")
    }
    
    @IBAction func operatorsButtonTapped(_ sender: UIButton) {
        guard let operators = sender.currentTitle else { return }
        
        print("\(userOperandInput)")
        
        // 숫자가 존재하고 연산자 눌렀을 경우, stack 올라감
        if userOperandInput != "0" {
            addNumberTotalStackView(operatorText: userOperatorInput, operandText: userOperandInput)
            
            totalInput += (userOperatorInput + userOperandInput)
            // 연산자 누르면 그동안 적었던 userInput이 totalInput으로 올라감. 왜? CE 누르면 userInput 초기화 되어야 하기 때문
            
            // numberStack 올라가면 앞에 적었던 숫자는 초기화 되고, 연산자는 아직 남아있음.
            userOperandInput = "0"
        }
        
        // 숫자가 비었을 경우, stack 올라가지 않고 userOperatorInput만 변경
        userOperatorInput = operators
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard userOperandInput != "0" else {
            userOperatorInput = ""
            return
        }
        
        addNumberTotalStackView(operatorText: userOperatorInput, operandText: userOperandInput)
        totalInput += (userOperatorInput + userOperandInput)
        // = 누르고 난 뒤, 다시 = 눌러도 연산 되지 않도록 userOperandInput 초기화
        userOperandInput = "0"
        
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
        // numberStack 모두 제거
        removeAllTotalStackView()
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        // 현재 입력되고 있는 숫자 0으로 초기화
        userOperandInput = "0"
    }
    
    @IBAction func plusminusButtonTapped(_ sender: UIButton) {
        if userOperandInput != "0" {
            userOperandInput = userOperandInput.contains("-") ? userOperandInput.trimmingCharacters(in: ["-"]) : "-\(userOperandInput)"
        }
    }
}




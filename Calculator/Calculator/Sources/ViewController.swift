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
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var numberTotalStackView: UIStackView!
    @IBOutlet weak var numberInnerStackView: CustomStackView!
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기에는 operatorLabel 아예 없음
        operatorLabel.text = ""
        operandLabel.text = "0"
        
    }
    
    // MARK: - setup
    
    private func addNumberTotalStackView(operatorText: String, operandText: String) {
        let numberStackView: UIStackView = {
            let sv = CustomStackView(frame: .zero)
            sv.operatorLabel.text = operatorText
            sv.operandLabel.text = operandText
            return sv
        }()
        numberTotalStackView.addArrangedSubview(numberStackView)
    }
    
    private func removeAllTotalStackView() {
        numberTotalStackView.arrangedSubviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        totalInput = ""
        userOperandInput = ""
        userOperatorInput = ""
//        print("모든 totalStackView 초기화. totalInput: \(totalInput)")
//        print("모든 totalStackView 초기화. userOperandInput: \(userOperandInput)")
//        print("모든 totalStackView 초기화. userOperatorInput: \(userOperatorInput)")
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
        
        // 숫자가 존재하고 연산자 눌렀을 경우, stack 올라감
        if userOperandInput != "0" {
            addNumberTotalStackView(operatorText: userOperatorInput, operandText: userOperandInput)
            
            totalInput += (userOperatorInput + userOperandInput)
//            print("operatorsButtonTapped의 userOperandInput: \(userOperandInput)")
//            print("operatorsButtonTapped의 userOperatorInput: \(userOperatorInput)")
//            print("operatorsButtonTapped의 totalInput: \(totalInput)")
            // 연산자 누르면 그동안 적었던 userInput이 totalInput으로 올라감. 왜? CE 누르면 userInput 초기화 되어야 하기 때문
            
            // numberStack 올라가면 앞에 적었던 숫자는 초기화 되고, 연산자는 아직 남아있음.
            userOperandInput = "0"
        }
        
        // 숫자가 비었을 경우, stack 올라가지 않고 userOperatorInput만 변경
        userOperatorInput = operators
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        do {
            totalInput += (userOperatorInput + userOperandInput)
            print("결과적으로 들어가는 Input: \(totalInput)")
            try ExpresstionParser.parse(from: totalInput)
        } catch {
            print(error)
        }
        
        // = 누르는 순간, 모든 totalStackView 초기화
        removeAllTotalStackView()
        
        // 연산 결과값 나와야 하지만 일단 초기화 시킴.
        userOperandInput = ""
        userOperatorInput = ""
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
        removeAllTotalStackView()
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        userOperandInput = "0"
    }
    
    @IBAction func plusminusButtonTapped(_ sender: UIButton) {
    }
}




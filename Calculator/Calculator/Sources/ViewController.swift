//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var userInput = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func operandsButtonTapped(_ sender: UIButton) {
        guard let operands = sender.currentTitle else { return }
        userInput += operands
        print(userInput)
    }
    
    @IBAction func operatorsButtonTapped(_ sender: UIButton) {
        guard let operators = sender.currentTitle else { return }
        userInput += operators
        print(userInput)
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        do {
            try ExpresstionParser.parse(from: userInput)
        } catch {
            print(error)
        }
        // input string 초기화
        userInput = ""
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func plusminusButtonTapped(_ sender: UIButton) {
    }
}

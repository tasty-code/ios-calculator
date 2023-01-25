//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!

    @IBAction func tappedOperandButton(_ sender: UIButton) {
        operandLabel.text = (operandLabel.text ?? "") + (sender.titleLabel?.text ?? "")
    }

    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        operatorLabel.text = sender.titleLabel?.text
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


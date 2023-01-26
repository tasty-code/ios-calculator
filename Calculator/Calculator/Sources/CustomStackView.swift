//
//  CustomStackView.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/26.
//

import UIKit

class CustomStackView: UIStackView {
    
    let operatorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .right
        label.contentMode = .left
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let operandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .right
        label.contentMode = .left
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        // 아래 코드를 여기 넣엇더니 안되는 거였음. 욕나오네..?
//        setupStackView()
//        setupLabel()
    }
    
    private func setupStackView() {
        self.axis = .horizontal
        self.spacing = 8
        self.alignment = .fill
        self.distribution = .fill
        self.contentMode = .scaleToFill
        
        self.addArrangedSubview(operatorLabel)
        self.addArrangedSubview(operandLabel)
    }
}

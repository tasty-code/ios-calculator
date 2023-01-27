//
//  CustomStackView.swift
//  Calculator
//
//  Created by 송선진 on 2023/01/26.
//

import UIKit

final class CustomStackView: UIStackView {
    
    let operatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .right
        label.contentMode = .left
        return label
    }()
    
    let operandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .right
        label.contentMode = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
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

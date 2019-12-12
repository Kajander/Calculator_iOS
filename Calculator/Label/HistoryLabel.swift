//
//  HistoryLabel.swift
//  Calculator
//
//  Created by Joakim Kajan on 12.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import UIKit

class HistoryLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        
        numberOfLines = 10
        textAlignment = .right
        textColor = .lightGray
        font = UIFont.boldSystemFont(ofSize: 22)
                   
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

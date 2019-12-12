//
//  FirstValueLabel.swift
//  Calculator
//
//  Created by Joakim Kajan on 11.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import UIKit

class FirstValueLabel: UILabel {
    
    var value: String
    
    init(frame: CGRect, value: String) {
        self.value = value
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        
        text = value
        textAlignment = .right
        textColor = .white
        font = UIFont.boldSystemFont(ofSize: 48)
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

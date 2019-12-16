//
//  CustomLabel.swift
//  Calculator
//
//  Created by Joakim Kajan on 14.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    var value: String
    var fontSize: CGFloat
    var color: UIColor
    var numOfLines: Int
    
    init(frame: CGRect, value: String, fontSize: CGFloat, textColor: UIColor, numOfLines: Int) {
        self.value = value
        self.fontSize = fontSize
        self.color = textColor
        self.numOfLines = numOfLines
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        
        font = UIFont.boldSystemFont(ofSize: fontSize)
        textAlignment = .right
        textColor = color
        numberOfLines = numOfLines
        translatesAutoresizingMaskIntoConstraints = false
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  Button.swift
//  Calculator
//
//  Created by Joakim Kajan on 10.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    var title: String
    var fontSize: CGFloat
    var color: UIColor
    var width: CGFloat
    var height: CGFloat
    let cornerRadius = CGFloat(5)
    
    init(frame: CGRect, title: String, fontSize: CGFloat, color: UIColor, width: CGFloat, height: CGFloat) {
        self.title = title
        self.fontSize = fontSize
        self.color = color
        self.width = width
        self.height = height
        
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        backgroundColor = color
        layer.cornerRadius = cornerRadius
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
      
    }
    
    
   
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


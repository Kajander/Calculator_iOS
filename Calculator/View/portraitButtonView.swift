//
//  ButtonView.swift
//  Calculator
//
//  Created by Joakim Kajan on 11.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import UIKit

class PortraitButtonView: UIView {
    
    var buttonHeight = CGFloat()
    var buttonWidth = CGFloat()
    var bottomConstant = CGFloat()
    var fullHeigth = CGFloat()
    var btnTrailConst = CGFloat()
    var btnBottConst = CGFloat()
    
    var cornerRadius = CGFloat(5)
    var padding = CGFloat(4.0)
    var width: CGFloat
    var height : CGFloat
    
    override init(frame: CGRect) {
        self.width = frame.width
        self.height = frame.height
        
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        
        if frame.height > frame.width {
            buttonHeight = (width / 5 - (2 * padding)) / 1.5
            buttonWidth = width / 4 - (1.2 * padding)
            // This should be done better
            btnTrailConst = -(buttonWidth + 2 * padding)
            btnBottConst = -(buttonHeight + padding)
            
        }else{
            buttonHeight = height / 10
            buttonWidth = (width / 2) / 8
            btnTrailConst = -(buttonWidth + 2 * padding)
            btnBottConst = -(buttonHeight + padding)
        }
        
        for title in ButtonTites.portraitButtonTitles {
            
            if title.isInt {
                let intTitle = Int(title)
                let button = CustomButton(frame: CGRect.zero, title: title, color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
                addSubview(button)
                
                switch intTitle {
                case 0:
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3 * btnTrailConst + 2 * padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                case 1:
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3 * btnTrailConst + 2 * padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: btnBottConst).isActive = true
                case 2:
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2 * btnTrailConst + padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: btnBottConst).isActive = true
                case 3:
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: btnTrailConst).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: btnBottConst).isActive = true
                case 4:
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3 * btnTrailConst + 2 * padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2 * btnBottConst).isActive = true
                case 5:
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2 * btnTrailConst + padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2 * btnBottConst).isActive = true
                case 6:
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: btnTrailConst).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2 * btnBottConst).isActive = true
                case 7:
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3 * btnTrailConst + 2 * padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3 * btnBottConst).isActive = true
                case 8:
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2 * btnTrailConst + padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3 * btnBottConst).isActive = true
                case 9:
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: btnTrailConst).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3 * btnBottConst).isActive = true
                default:
                    print("Problems :S")
                }
                
            }else{
                let button = CustomButton(frame: CGRect.zero, title: title, color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
                addSubview(button)
                switch title {
                case "+/-":
                button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: btnTrailConst).isActive = true
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                button.backgroundColor = Colors.redColor
                case "↥":
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                    button.backgroundColor = Colors.redColor
                case ".":
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2 * btnTrailConst + padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                case "+":
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: btnBottConst).isActive = true
                    button.backgroundColor = Colors.greenColor
                case "-":
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2 * btnBottConst).isActive = true
                    button.backgroundColor = Colors.greenColor
                case "x":
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3 * btnBottConst).isActive = true
                    button.backgroundColor = Colors.greenColor
                case "÷":
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnBottConst).isActive = true
                    button.backgroundColor = Colors.greenColor
                case "↤":
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: btnTrailConst).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnBottConst).isActive = true
                    button.backgroundColor = Colors.purpleColor
                case "C":
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2 * btnTrailConst + padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnBottConst).isActive = true
                    button.backgroundColor = Colors.purpleColor
                case "AC":
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3 * btnTrailConst + 2 * padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnBottConst).isActive = true
                    button.backgroundColor = Colors.purpleColor
                default:
                    print("More problems :S")
                }
            }
        }
        
        fullHeigth = 5 * buttonHeight + bottomConstant + (5 * padding)
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

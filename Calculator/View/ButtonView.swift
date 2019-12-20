//
//  ButtonView.swift
//  Calculator
//
//  Created by Joakim Kajan on 11.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import UIKit

class ButtonView: UIView {
    
    var buttonHeight = CGFloat()
    var buttonWidth = CGFloat()
    
    var fullHeigth = CGFloat()
    var bottomConstant = CGFloat()
    var btnTrailConst = CGFloat()
    var btnLeadConst = CGFloat()
    var btnBottConst = CGFloat()
    var btnScientificBottomConst = CGFloat()
    
    var fontSize = CGFloat(0)
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
        tag = ViewTags.buttonViewTag
        
        if frame.height > frame.width {
            // Portrait
            buttonHeight = (width / 5 - (2 * padding)) / 1.5
            buttonWidth = width / 4 - (1.2 * padding)
            // This should be more clear
            btnTrailConst = -(buttonWidth + 2 * padding)
            btnBottConst = -(buttonHeight + padding)
            fontSize = FontSize.portraitButtonFontSize
            createBasicButtons()
            
        }else{
            // Landscape
            buttonHeight = height / 10
            buttonWidth = (width / 2) / 8
            btnTrailConst = -(buttonWidth + 2 * padding)
            btnBottConst = -(buttonHeight + padding)
            
            btnLeadConst = (buttonWidth + 2 * padding)
            btnScientificBottomConst = -(buttonHeight + padding)

            fontSize = FontSize.landscapeButtonFontSize
            createBasicButtons()
            createScientificButtons()
        }

        fullHeigth = 5 * buttonHeight + bottomConstant + (5 * padding)
        heightAnchor.constraint(equalToConstant: fullHeigth).isActive = true
        
    }
    
    func createBasicButtons() {
        
        for title in ButtonTitles.basicTitles {
            if title.isInteger {
                let intTitle = Int(title)
                let button = CustomButton(frame: CGRect.zero, title: title, fontSize: fontSize, color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
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
                
                let button = CustomButton(frame: CGRect.zero, title: title, fontSize: fontSize, color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
                addSubview(button)
                switch title {
                case "-/+":
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: btnTrailConst).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                case "↥":
                    button.tag = ButtonTags.upArrowButtonTag
                    button.isUserInteractionEnabled = false
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                    button.backgroundColor = Colors.redColor.withAlphaComponent(Colors.inactiveAlpha)
                case ".":
                    button.tag = ButtonTags.dotButtonTag
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
                case "⇥":
                    button.tag = ButtonTags.rightArrowButtonTag
                    button.isUserInteractionEnabled = false
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: btnTrailConst).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnBottConst).isActive = true
                    button.backgroundColor = Colors.purpleColor.withAlphaComponent(Colors.inactiveAlpha)
                case "C":
                    button.tag = ButtonTags.cancelButtonTag
                    button.isUserInteractionEnabled = false
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2 * btnTrailConst + padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnBottConst).isActive = true
                    button.backgroundColor = Colors.purpleColor.withAlphaComponent(Colors.inactiveAlpha)
                case "AC":
                    button.tag = ButtonTags.cancelAllButtonTag
                    button.isUserInteractionEnabled = false
                    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3 * btnTrailConst + 2 * padding).isActive = true
                    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnBottConst).isActive = true
                    button.backgroundColor = Colors.purpleColor.withAlphaComponent(Colors.inactiveAlpha)
                default:
                    print("More problems :S")
                }
            }
            
        }
    }
    
    func createScientificButtons() {
        
        let font:UIFont? = UIFont.boldSystemFont(ofSize: fontSize)
        let fontSuper:UIFont? = UIFont.boldSystemFont(ofSize: fontSize / 2)
        
        
        
        for title in ButtonTitles.scientificTitles {
            
            let button = CustomButton(frame: CGRect.zero, title: title, fontSize: fontSize, color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
            addSubview(button)
            
            
            switch title {
            case "a2":
                button.tag = ButtonTags.powerOfTwoTag
                let attString:NSMutableAttributedString = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font:font!])
                attString.setAttributes([NSAttributedString.Key.font:fontSuper!,NSAttributedString.Key.baselineOffset:10], range: NSRange(location:1,length:1))
                button.setAttributedTitle(attString, for: .normal)
                button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding).isActive = true
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnScientificBottomConst).isActive = true
            case "ab":
                button.tag = ButtonTags.powerOfBTag
                let attString:NSMutableAttributedString = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font:font!])
                attString.setAttributes([NSAttributedString.Key.font:fontSuper!,NSAttributedString.Key.baselineOffset:10], range: NSRange(location:1,length:1))
                button.setAttributedTitle(attString, for: .normal)
                button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: btnLeadConst).isActive = true
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnScientificBottomConst).isActive = true
            case "(":
                button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2 * btnLeadConst - padding).isActive = true
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnScientificBottomConst).isActive = true
            case ")":
                button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3 * btnLeadConst - 2 * padding).isActive = true
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnScientificBottomConst).isActive = true
            case "sin":
                button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding).isActive = true
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3 * btnScientificBottomConst).isActive = true
            case "cos":
                button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: btnLeadConst).isActive = true
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3 * btnScientificBottomConst).isActive = true
            case "tan":
                button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2 * btnLeadConst - padding).isActive = true
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3 * btnScientificBottomConst).isActive = true
            default:
                print("Scientific probelms :S")
            }
            
            
            
            
            
            
            
            
        }
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

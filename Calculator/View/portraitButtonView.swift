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
    
       
        let upArrowButton = CustomButton(frame: CGRect.zero, title: "↥", color: Colors.redColor, width: buttonWidth, height: buttonHeight)
        addSubview(upArrowButton)
        upArrowButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
        upArrowButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
        let commaButton = CustomButton(frame: CGRect.zero, title: ".", color: UIColor.white, width: buttonWidth, height: buttonHeight)
        addSubview(commaButton)
        commaButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: btnTrailConst).isActive = true
        commaButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        let zeroButton = CustomButton(frame: CGRect.zero, title: "0", color: Colors.whiteColor, width: 2 * buttonWidth + padding, height: buttonHeight)
        addSubview(zeroButton)
        zeroButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2 * btnTrailConst + padding).isActive = true
        zeroButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        let addButton = CustomButton(frame: CGRect.zero, title: "+", color: Colors.greenColor, width: buttonWidth, height: buttonHeight)
        addSubview(addButton)
        addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
        addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: btnBottConst).isActive = true

        let threeButton = CustomButton(frame: CGRect.zero, title: "3", color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
        addSubview(threeButton)
        threeButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -padding).isActive = true
        threeButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor, constant: -4).isActive = true

        let twoButton = CustomButton(frame: CGRect.zero, title: "2", color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
        addSubview(twoButton)
        twoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2 * btnTrailConst + padding).isActive = true
        twoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: btnBottConst).isActive = true

        let oneButton = CustomButton(frame: CGRect.zero, title: "1", color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
        addSubview(oneButton)
        oneButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3 * btnTrailConst + 2 * padding).isActive = true
        oneButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: btnBottConst).isActive = true

        let subtractButton = CustomButton(frame: CGRect.zero, title: "-", color: Colors.greenColor, width: buttonWidth, height: buttonHeight)
        addSubview(subtractButton)
        subtractButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
        subtractButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2 * btnBottConst).isActive = true

        let sixButton = CustomButton(frame: CGRect.zero, title: "6", color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
        addSubview(sixButton)
        sixButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: btnTrailConst).isActive = true
        sixButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2 * btnBottConst).isActive = true

        let fiveButton = CustomButton(frame: CGRect.zero, title: "5", color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
        addSubview(fiveButton)
        fiveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2 * btnTrailConst + padding).isActive = true
        fiveButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2 * btnBottConst).isActive = true

        let fourButton = CustomButton(frame: CGRect.zero, title: "4", color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
        addSubview(fourButton)
        fourButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3 * btnTrailConst + 2 * padding).isActive = true
        fourButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2 * btnBottConst).isActive = true

        let multiplyButton = CustomButton(frame: CGRect.zero, title: "x", color: Colors.greenColor, width: buttonWidth, height: buttonHeight)
        addSubview(multiplyButton)
        multiplyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
        multiplyButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3 * btnBottConst).isActive = true

        let nineButton = CustomButton(frame: CGRect.zero, title: "9", color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
        addSubview(nineButton)
        nineButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: btnTrailConst).isActive = true
        nineButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3 * btnBottConst).isActive = true

        let eightButton = CustomButton(frame: CGRect.zero, title: "8", color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
        addSubview(eightButton)
        eightButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2 * btnTrailConst + padding).isActive = true
        eightButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3 * btnBottConst).isActive = true

        let sevenButton = CustomButton(frame: CGRect.zero, title: "7", color: Colors.whiteColor, width: buttonWidth, height: buttonHeight)
        addSubview(sevenButton)
        sevenButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3 * btnTrailConst + 2 * padding).isActive = true
        sevenButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3 * btnBottConst).isActive = true

        let divideButton = CustomButton(frame: CGRect.zero, title: "÷", color: Colors.greenColor, width: buttonWidth, height: buttonHeight)
        addSubview(divideButton)
        divideButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
        divideButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnBottConst).isActive = true

        let removeNumberButton = CustomButton(frame: CGRect.zero, title: "↤", color: Colors.purpleColor, width: buttonWidth, height: buttonHeight)
        addSubview(removeNumberButton)
        removeNumberButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: btnTrailConst).isActive = true
        removeNumberButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnBottConst).isActive = true

        let clearButton = CustomButton(frame: CGRect.zero, title: "C", color: Colors.purpleColor, width: buttonWidth, height: buttonHeight)
        addSubview(clearButton)
        clearButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2 * btnTrailConst + padding).isActive = true
        clearButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnBottConst).isActive = true

        let allClearButton = CustomButton(frame: CGRect.zero, title: "AC", color: Colors.purpleColor, width: buttonWidth, height: buttonHeight)
        addSubview(allClearButton)
        allClearButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3 * btnTrailConst + 2 * padding).isActive = true
        allClearButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4 * btnBottConst).isActive = true
        
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

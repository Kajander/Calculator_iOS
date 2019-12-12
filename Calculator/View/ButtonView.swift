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
    let bottomConstant = CGFloat(25)
    let cornerRadius = CGFloat(5)
    let padding = CGFloat(4.0)
    var width: CGFloat
    
    override init(frame: CGRect) {
        self.width = frame.width / 4
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        
        buttonHeight = (width - (2 * padding)) / 1.5
        buttonWidth = (width - (2 * padding))
        
        let zeroButton = CustomButton(frame: CGRect.zero, title: "0", color: Colors.whiteColor)
        zeroButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(zeroButton)
        zeroButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -bottomConstant).isActive = true
        zeroButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        zeroButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        zeroButton.widthAnchor.constraint(equalToConstant: buttonWidth * 2 + padding).isActive = true
        
        let commaButton = CustomButton(frame: CGRect.zero, title: ".", color: Colors.whiteColor)
        commaButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(commaButton)
        commaButton.leadingAnchor.constraint(equalTo: zeroButton.trailingAnchor, constant: 4).isActive = true
        commaButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -bottomConstant).isActive = true
        commaButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        commaButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        let summaryButton = CustomButton(frame: CGRect.zero, title: "↥", color: Colors.redColor)
        summaryButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(summaryButton)
        summaryButton.leadingAnchor.constraint(equalTo: commaButton.trailingAnchor, constant: 4).isActive = true
        summaryButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
        summaryButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -bottomConstant).isActive = true
        summaryButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        let oneButton = CustomButton(frame: CGRect.zero, title: "1", color: Colors.whiteColor)
        oneButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(oneButton)
        oneButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        oneButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor, constant: -4).isActive = true
        oneButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        oneButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        let twoButton = CustomButton(frame: CGRect.zero, title: "2", color: Colors.whiteColor)
        twoButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(twoButton)
        twoButton.leadingAnchor.constraint(equalTo: oneButton.trailingAnchor, constant: 4).isActive = true
        twoButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor, constant: -4).isActive = true
        twoButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        twoButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
        let threeButton = CustomButton(frame: CGRect.zero, title: "3", color: Colors.whiteColor)
        threeButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(threeButton)
        threeButton.leadingAnchor.constraint(equalTo: twoButton.trailingAnchor, constant: 4).isActive = true
        threeButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor, constant: -4).isActive = true
        threeButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        threeButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
        let addButton = CustomButton(frame: CGRect.zero, title: "+", color: Colors.greenColor)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(addButton)
        addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
        addButton.leadingAnchor.constraint(equalTo: threeButton.trailingAnchor, constant: 4).isActive = true
        addButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor, constant: -4).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        let fourButton = CustomButton(frame: CGRect.zero, title: "4", color: Colors.whiteColor)
        fourButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(fourButton)
        fourButton.bottomAnchor.constraint(equalTo: oneButton.topAnchor, constant: -4).isActive = true
        fourButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        fourButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        fourButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
        let fiveButton = CustomButton(frame: CGRect.zero, title: "5", color: Colors.whiteColor)
        fiveButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(fiveButton)
        fiveButton.leadingAnchor.constraint(equalTo: fourButton.trailingAnchor, constant: 4).isActive = true
        fiveButton.bottomAnchor.constraint(equalTo: oneButton.topAnchor, constant: -4).isActive = true
        fiveButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        fiveButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
        let sixButton = CustomButton(frame: CGRect.zero, title: "6", color: Colors.whiteColor)
        sixButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sixButton)
        sixButton.leadingAnchor.constraint(equalTo: fiveButton.trailingAnchor, constant: 4).isActive = true
        sixButton.bottomAnchor.constraint(equalTo: oneButton.topAnchor, constant: -4).isActive = true
        sixButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        sixButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
        let subtractButton = CustomButton(frame: CGRect.zero, title: "-", color: Colors.greenColor)
        subtractButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subtractButton)
        subtractButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
        subtractButton.leadingAnchor.constraint(equalTo: sixButton.trailingAnchor, constant: 4).isActive = true
        subtractButton.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -4).isActive = true
        subtractButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        let sevenButton = CustomButton(frame: CGRect.zero, title: "7", color: Colors.whiteColor)
        sevenButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sevenButton)
        sevenButton.bottomAnchor.constraint(equalTo: fourButton.topAnchor, constant: -4).isActive = true
        sevenButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        sevenButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        sevenButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
        let eightButton = CustomButton(frame: CGRect.zero, title: "8", color: Colors.whiteColor)
        eightButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(eightButton)
        eightButton.leadingAnchor.constraint(equalTo: sevenButton.trailingAnchor, constant: 4).isActive = true
        eightButton.bottomAnchor.constraint(equalTo: fourButton.topAnchor, constant: -4).isActive = true
        eightButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        eightButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
        let nineButton = CustomButton(frame: CGRect.zero, title: "9", color: Colors.whiteColor)
        nineButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nineButton)
        nineButton.leadingAnchor.constraint(equalTo: eightButton.trailingAnchor, constant: 4).isActive = true
        nineButton.bottomAnchor.constraint(equalTo: fourButton.topAnchor, constant: -4).isActive = true
        nineButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        nineButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
        let multiplyButton = CustomButton(frame: CGRect.zero, title: "x", color: Colors.greenColor)
        multiplyButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(multiplyButton)
        multiplyButton.leadingAnchor.constraint(equalTo: nineButton.trailingAnchor, constant: 4).isActive = true
        multiplyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
        multiplyButton.bottomAnchor.constraint(equalTo: fourButton.topAnchor, constant: -4).isActive = true
        multiplyButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        let allClearButton = CustomButton(frame: CGRect.zero, title: "AC", color: Colors.purpleColor)
        allClearButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(allClearButton)
        allClearButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        allClearButton.bottomAnchor.constraint(equalTo: sevenButton.topAnchor, constant: -4).isActive = true
        allClearButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        allClearButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
        let clearButton = CustomButton(frame: CGRect.zero, title: "C", color: Colors.purpleColor)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(clearButton)
        clearButton.leadingAnchor.constraint(equalTo: allClearButton.trailingAnchor, constant: 4).isActive = true
        clearButton.bottomAnchor.constraint(equalTo: sevenButton.topAnchor, constant: -4).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
        let removeNumberButton = CustomButton(frame: CGRect.zero, title: "↤", color: Colors.purpleColor)
        removeNumberButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(removeNumberButton)
        removeNumberButton.leadingAnchor.constraint(equalTo: clearButton.trailingAnchor, constant: 4).isActive = true
        removeNumberButton.bottomAnchor.constraint(equalTo: sevenButton.topAnchor, constant: -4).isActive = true
        removeNumberButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        removeNumberButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        
        let divideButton = CustomButton(frame: CGRect.zero, title: "÷", color: Colors.greenColor)
        divideButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(divideButton)
        divideButton.leadingAnchor.constraint(equalTo: removeNumberButton.trailingAnchor, constant: 4).isActive = true
        divideButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
        divideButton.bottomAnchor.constraint(equalTo: sevenButton.topAnchor, constant: -4).isActive = true
        divideButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
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

////
////  LandscapeButtonView.swift
////  Calculator
////
////  Created by Joakim Kajan on 12.12.2019.
////  Copyright © 2019 JapeSoft. All rights reserved.
////
//
//import UIKit
//
//class LandscapeButtonView: PortraitButtonView {
//
//
//    override func setupView() {
//
//        backgroundColor = .cyan
//
//
//
//            buttonHeight = (width / 5 - (2 * padding)) / 2
//            buttonWidth = width / 5 - (1.2 * padding)
//
//            let upArrowButton = CustomButton(frame: CGRect.zero, title: "↥", color: Colors.redColor)
//            upArrowButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(upArrowButton)
//            upArrowButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
//            upArrowButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            upArrowButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            upArrowButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//
//            let commaButton = CustomButton(frame: CGRect.zero, title: ".", color: Colors.whiteColor)
//            commaButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(commaButton)
//            commaButton.trailingAnchor.constraint(equalTo: upArrowButton.leadingAnchor, constant: -padding).isActive = true
//            commaButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            commaButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//            commaButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//
//            let zeroButton = CustomButton(frame: CGRect.zero, title: "0", color: Colors.whiteColor)
//            zeroButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(zeroButton)
//            zeroButton.trailingAnchor.constraint(equalTo: commaButton.leadingAnchor, constant: -padding).isActive = true
//            zeroButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            zeroButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            zeroButton.widthAnchor.constraint(equalToConstant: 2 * buttonWidth + padding).isActive = true
//
//            let addButton = CustomButton(frame: CGRect.zero, title: "+", color: Colors.greenColor)
//            addButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(addButton)
//            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
//            addButton.bottomAnchor.constraint(equalTo: upArrowButton.topAnchor, constant: -4).isActive = true
//            addButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//            addButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//
//            let threeButton = CustomButton(frame: CGRect.zero, title: "3", color: Colors.whiteColor)
//            threeButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(threeButton)
//            threeButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -padding).isActive = true
//            threeButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor, constant: -4).isActive = true
//            threeButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            threeButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let twoButton = CustomButton(frame: CGRect.zero, title: "2", color: Colors.whiteColor)
//            twoButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(twoButton)
//            twoButton.trailingAnchor.constraint(equalTo: threeButton.leadingAnchor, constant: -padding).isActive = true
//            twoButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor, constant: -4).isActive = true
//            twoButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            twoButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//
//            let oneButton = CustomButton(frame: CGRect.zero, title: "1", color: Colors.whiteColor)
//            oneButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(oneButton)
//            oneButton.trailingAnchor.constraint(equalTo: twoButton.leadingAnchor, constant: -padding).isActive = true
//            oneButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor, constant: -4).isActive = true
//            oneButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//            oneButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//
//            let subtractButton = CustomButton(frame: CGRect.zero, title: "-", color: Colors.greenColor)
//            subtractButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(subtractButton)
//            subtractButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
//            subtractButton.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -4).isActive = true
//            subtractButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            subtractButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let sixButton = CustomButton(frame: CGRect.zero, title: "6", color: Colors.whiteColor)
//            sixButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(sixButton)
//            sixButton.trailingAnchor.constraint(equalTo: subtractButton.leadingAnchor, constant: -padding).isActive = true
//            sixButton.bottomAnchor.constraint(equalTo: threeButton.topAnchor, constant: -4).isActive = true
//            sixButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            sixButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let fiveButton = CustomButton(frame: CGRect.zero, title: "5", color: Colors.whiteColor)
//            fiveButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(fiveButton)
//            fiveButton.trailingAnchor.constraint(equalTo: sixButton.leadingAnchor, constant: -padding).isActive = true
//            fiveButton.bottomAnchor.constraint(equalTo: twoButton.topAnchor, constant: -4).isActive = true
//            fiveButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            fiveButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let fourButton = CustomButton(frame: CGRect.zero, title: "4", color: Colors.whiteColor)
//            fourButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(fourButton)
//            fourButton.trailingAnchor.constraint(equalTo: fiveButton.leadingAnchor, constant: -padding).isActive = true
//            fourButton.bottomAnchor.constraint(equalTo: oneButton.topAnchor, constant: -4).isActive = true
//            fourButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            fourButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let multiplyButton = CustomButton(frame: CGRect.zero, title: "x", color: Colors.greenColor)
//            multiplyButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(multiplyButton)
//            multiplyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
//            multiplyButton.bottomAnchor.constraint(equalTo: subtractButton.topAnchor, constant: -4).isActive = true
//            multiplyButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            multiplyButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let nineButton = CustomButton(frame: CGRect.zero, title: "9", color: Colors.whiteColor)
//            nineButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(nineButton)
//            nineButton.trailingAnchor.constraint(equalTo: multiplyButton.leadingAnchor, constant: -padding).isActive = true
//            nineButton.bottomAnchor.constraint(equalTo: sixButton.topAnchor, constant: -4).isActive = true
//            nineButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            nineButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let eightButton = CustomButton(frame: CGRect.zero, title: "8", color: Colors.whiteColor)
//            eightButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(eightButton)
//            eightButton.trailingAnchor.constraint(equalTo: nineButton.leadingAnchor, constant: -padding).isActive = true
//            eightButton.bottomAnchor.constraint(equalTo: fiveButton.topAnchor, constant: -4).isActive = true
//            eightButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            eightButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let sevenButton = CustomButton(frame: CGRect.zero, title: "7", color: Colors.whiteColor)
//            sevenButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(sevenButton)
//            sevenButton.trailingAnchor.constraint(equalTo: eightButton.leadingAnchor, constant: -padding).isActive = true
//            sevenButton.bottomAnchor.constraint(equalTo: fourButton.topAnchor, constant: -4).isActive = true
//            sevenButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            sevenButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let divideButton = CustomButton(frame: CGRect.zero, title: "÷", color: Colors.greenColor)
//            divideButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(divideButton)
//            divideButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
//            divideButton.bottomAnchor.constraint(equalTo: sevenButton.topAnchor, constant: -4).isActive = true
//            divideButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            divideButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let removeNumberButton = CustomButton(frame: CGRect.zero, title: "↤", color: Colors.purpleColor)
//            removeNumberButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(removeNumberButton)
//            removeNumberButton.trailingAnchor.constraint(equalTo: divideButton.leadingAnchor, constant: -padding).isActive = true
//            removeNumberButton.bottomAnchor.constraint(equalTo: sevenButton.topAnchor, constant: -4).isActive = true
//            removeNumberButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            removeNumberButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let clearButton = CustomButton(frame: CGRect.zero, title: "C", color: Colors.purpleColor)
//            clearButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(clearButton)
//            clearButton.trailingAnchor.constraint(equalTo: removeNumberButton.leadingAnchor, constant: -padding).isActive = true
//            clearButton.bottomAnchor.constraint(equalTo: sevenButton.topAnchor, constant: -4).isActive = true
//            clearButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            clearButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//            let allClearButton = CustomButton(frame: CGRect.zero, title: "AC", color: Colors.purpleColor)
//            allClearButton.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(allClearButton)
//            allClearButton.trailingAnchor.constraint(equalTo: clearButton.leadingAnchor, constant: -padding).isActive = true
//            allClearButton.bottomAnchor.constraint(equalTo: sevenButton.topAnchor, constant: -4).isActive = true
//            allClearButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//            allClearButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//
//
//
//
//            fullHeigth = 5 * buttonHeight + bottomConstant + (5 * padding)
//
//
//    }
//
//
//
//    /*
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
//    */
//
//}

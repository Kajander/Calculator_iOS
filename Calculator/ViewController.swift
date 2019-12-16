//
//  ViewController.swift
//  Calculator
//
//  Created by Joakim Kajan on 10.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pressHandler = PressHandler()
    let historyView = HistoryView()
    // Counter is for knowing the ammount of lines in historylabel (max 10 is allowed)
    var counter = Int()
    let generator = UIImpactFeedbackGenerator(style: .light)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        checkOrientation(frame: view.frame)
    }
    
    func checkOrientation(frame: CGRect) {
        
        if frame.height > frame.width {
            setupPortraitView()
            
        }else{
            setupLandscapeView()
        }
    }
    
    
    
    func setupPortraitView() {
        setupButtons(frame: view.frame)
        
    }
    
    
    func setupLandscapeView() {
        setupButtons(frame: view.frame)
    }
   
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        if UIDevice.current.orientation.isLandscape {
//            print("Landscape")
//
//            let joo = view.viewWithTag(10)
//            joo?.removeFromSuperview()
//
//            let test = LandscapeButtonView()
//            test.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview(test)
//            test.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//            test.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//            test.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//            test.heightAnchor.constraint(equalToConstant: view.frame.width / 3 * 2).isActive = true
////            var buttonHeight = CGFloat()
////            var buttonWidth = CGFloat()
////            var fullHeigth = CGFloat()
////            let bottomConstant = CGFloat(25)
////            let cornerRadius = CGFloat(5)
////            let padding = CGFloat(4.0)
////            var width: CGFloat
//
//        } else {
//            print("Portrait")
//        }
//    }
    
//    func changeTest() {
//        setupButtons(frame: view.frame)
//
//    }

    func setupButtons(frame: CGRect) {
        
        let buttonView = ButtonView(frame: frame)
        buttonView.tag = 10
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonView)
        buttonView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: buttonView.fullHeigth).isActive = true
        
        for view in buttonView.subviews {
            let button = view as! UIButton
            let title = button.currentTitle!
            
            if title.isInt == true {
                button.addTarget(self, action: #selector(numberPressed(sender:)), for: .touchUpInside)
            }else{
                
                if title == "." {
                    button.addTarget(self, action: #selector(commaPressed(sender:)), for: .touchUpInside)
                }else if title == "↥" {
                    button.addTarget(self, action: #selector(upArrowPressed(sender:)), for: .touchUpInside)
                }else if title == "⇥" {
                    button.addTarget(self, action: #selector(removeNumber(sender:)), for: .touchUpInside)
                }else if title == "+" || title == "-" || title == "x" || title == "÷" {
                    button.addTarget(self, action: #selector(symbolPressed(sender:)), for: .touchUpInside)
                }else if title == "C" {
                    button.addTarget(self, action: #selector(cancelPressed(sender:)), for: .touchUpInside)
                }else if title == "AC" {
                    button.addTarget(self, action: #selector(cancelAllPressed(sender:)), for: .touchUpInside)
                }else if title == "-/+" {
                    button.addTarget(self, action: #selector(negativePositivePressed(sender:)), for: .touchUpInside)
                }
            }
        }
        
        setupNumbersView(buttonView: buttonView)
        
    }
    
    
    //MARK: Remove number
    @objc func removeNumber(sender: UIButton) {

        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!
        let secondNumberLabel = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let secondText = secondNumberLabel.text!
        let symbolLabel = view.viewWithTag(LabelTags.symboLabelTag) as! UILabel
        let symbol = symbolLabel.text!
        
        let summaryValueLabel = view.viewWithTag(LabelTags.summaryValueLabelTag) as! UILabel

        if currentText != "0" {
            generator.impactOccurred()

            let (summary, firstString) = pressHandler.handleRemoveButton(currentText: currentText, secondText: secondText, symbol: symbol)
            if secondText != ""{
                summaryValueLabel.text = summary
            }
            firstNumberLabel.text = firstString
            
            if firstString == "0" {
                    deactivateButton(tag: ButtonTags.rightArrowButtonTag)
                if secondText != "" {
                    deactivateButton(tag: ButtonTags.upArrowButtonTag)
                }else{
                    deactivateButton(tag: ButtonTags.cancelButtonTag)
                }
            }

            if !firstString.contains(".") {
                activateButton(tag: ButtonTags.dotButtonTag)
            }
        }

    }
    
    //MARK: CancelPressed
    @objc func cancelPressed(sender: UIButton) {
        generator.impactOccurred()

        resetLabels(resetAll: false)
        
        deactivateButton(tag: ButtonTags.upArrowButtonTag)
        deactivateButton(tag: ButtonTags.rightArrowButtonTag)
        deactivateButton(tag: ButtonTags.cancelButtonTag)
        activateButton(tag: ButtonTags.dotButtonTag)


    }
    
    //MARK: CancelAllPressed
    @objc func cancelAllPressed(sender: UIButton) {
        generator.impactOccurred()

        resetLabels(resetAll: true)
        historyView.historyLabel.text = ""
        counter = 0

        deactivateButton(tag: ButtonTags.upArrowButtonTag)
        deactivateButton(tag: ButtonTags.rightArrowButtonTag)
        deactivateButton(tag: ButtonTags.cancelButtonTag)
        deactivateButton(tag: ButtonTags.cancelAllButtonTag)

    }
    
    
    //MARK: UpArrowPressed
    @objc func upArrowPressed(sender: UIButton) {
        generator.impactOccurred()
        
        pushToHistory()
        
        deactivateButton(tag: ButtonTags.upArrowButtonTag)
        deactivateButton(tag: ButtonTags.rightArrowButtonTag)
        deactivateButton(tag: ButtonTags.cancelButtonTag)
        activateButton(tag: ButtonTags.cancelAllButtonTag)
            
    }

    
    //MARK: Negative Positive change
    @objc func negativePositivePressed(sender: UIButton) {
        generator.impactOccurred()

        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!

        if currentText.contains("-") {
            firstNumberLabel.text = String(currentText.dropFirst())
        }else{
            firstNumberLabel.text = "-" + currentText

        }

    }
    
    
    //MARK: CommaPressed
    @objc func commaPressed(sender: UIButton) {
        generator.impactOccurred()

        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!

        if !currentText.contains(".") {
            let newText = currentText + ".0"
            firstNumberLabel.text! = newText

            deactivateButton(tag: ButtonTags.dotButtonTag)
        }

    }
    
    //MARK: SymbolPressed
    @objc func symbolPressed(sender: UIButton) {
        generator.impactOccurred()

        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!
        let secondNumberLabel = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let secondText = secondNumberLabel.text!
        let symbolLabel = view.viewWithTag(LabelTags.symboLabelTag) as! UILabel
        let symbol = symbolLabel.text!
        let summaryLabel = view.viewWithTag(LabelTags.summaryValueLabelTag) as! UILabel
        
        if symbol != "", currentText != "0" {

            symbolLabel.text = sender.currentTitle!
            summaryLabel.text = pressHandler.calculate(symbol: sender.currentTitle!, currentText: currentText, secondText: secondText)

        }else if currentText != "0" {

            symbolLabel.text = sender.currentTitle!
            secondNumberLabel.text = firstNumberLabel.text!
            firstNumberLabel.text! = "0"

            deactivateButton(tag: ButtonTags.rightArrowButtonTag)
            
        }
    }
    
    //MARK: NumberPressed
    @objc func numberPressed(sender: UIButton) {
        generator.impactOccurred()

        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!
        let secondNumberLabel = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let secondText = secondNumberLabel.text!
        let symbolLabel = view.viewWithTag(LabelTags.symboLabelTag) as! UILabel
        let symbol = symbolLabel.text!
        let buttonPressed = sender.currentTitle!
        let summaryLabel = view.viewWithTag(LabelTags.summaryValueLabelTag) as! UILabel

        if currentText.count < 10 {
            (summaryLabel.text, firstNumberLabel.text) = pressHandler.handleNumberPress(currentText: currentText, secondText: secondText, symbol: symbol, buttonPressed: buttonPressed)

            if secondNumberLabel.text! != "" {
                activateButton(tag: ButtonTags.upArrowButtonTag)
            }
            if firstNumberLabel.text != "0" {
                activateButton(tag: ButtonTags.rightArrowButtonTag)
                activateButton(tag: ButtonTags.cancelButtonTag)
            }
        }

    }
    
    
    //MARK: Push to history
    func pushToHistory() {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!
        let secondNumberLabel = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let secondText = secondNumberLabel.text!
        let summaryLabel = view.viewWithTag(LabelTags.summaryValueLabelTag) as! UILabel
        let summaryText = summaryLabel.text!
        let symbolLabel = view.viewWithTag(LabelTags.symboLabelTag) as! UILabel
        let symbol = symbolLabel.text!
        let historyText = historyView.historyLabel.text!
        let newLine = secondText + " " + symbol + " " + currentText + " = " + summaryText

        historyView.historyLabel.text = historyText + "\n" + newLine
        counter += 1
        resetLabels(resetAll: false)

    }
    
    //MARK: Reset Labels
    func resetLabels(resetAll: Bool) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let secondNumberLabel = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let summaryLabel = view.viewWithTag(LabelTags.summaryValueLabelTag) as! UILabel
        let symbolLabel = view.viewWithTag(LabelTags.symboLabelTag) as! UILabel

        if resetAll == true {
            
            firstNumberLabel.text = "0"
            secondNumberLabel.text = ""
            summaryLabel.text = ""
            symbolLabel.text = ""
            //history here too
            
        }else{
            
            firstNumberLabel.text = "0"
            secondNumberLabel.text = ""
            summaryLabel.text = ""
            symbolLabel.text = ""
            
        }
    }
    
    func deactivateButton(tag: Int) {
        let button = view.viewWithTag(tag) as! UIButton
        button.isUserInteractionEnabled = false
        if ButtonTags.upArrowButtonTag == tag {
            button.backgroundColor = Colors.redColor.withAlphaComponent(Colors.inactiveAlpha)
        }else if ButtonTags.dotButtonTag == tag {
            button.backgroundColor = Colors.whiteColor.withAlphaComponent(Colors.inactiveAlpha)
        }else{
            button.backgroundColor = Colors.purpleColor.withAlphaComponent(Colors.inactiveAlpha)
        }
    }
    
    func activateButton(tag: Int) {
        let button = view.viewWithTag(tag) as! UIButton
        button.isUserInteractionEnabled = true
        
        if ButtonTags.upArrowButtonTag == tag {
            button.backgroundColor = Colors.redColor.withAlphaComponent(Colors.activeAlpha)
        }else if ButtonTags.dotButtonTag == tag {
            button.backgroundColor = Colors.whiteColor.withAlphaComponent(Colors.activeAlpha)
        }else{
            button.backgroundColor = Colors.purpleColor.withAlphaComponent(Colors.activeAlpha)
        }
        
    }
    
    
    
    //MARK:- Setup

    
    func setupNumbersView(buttonView: UIView) {
        
        let numbersView = NumbersView(frame: view.frame)
        numbersView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(numbersView)
        numbersView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive  = true
        numbersView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        numbersView.bottomAnchor.constraint(equalTo: buttonView.topAnchor, constant: -10).isActive = true
        numbersView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        setupHistoryView(numbersView: numbersView)
        
    }
    
    func setupHistoryView(numbersView: UIView) {
        
        historyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(historyView)
        historyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        historyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive  = true
        historyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        historyView.bottomAnchor.constraint(equalTo: numbersView.topAnchor, constant: -25).isActive = true
    }
    
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

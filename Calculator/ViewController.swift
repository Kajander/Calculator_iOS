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
    let numbersView = NumbersView()
    let historyView = HistoryView()
    // Counter is for knowing the ammount of lines in historylabel (max 10 is allowed)
    var counter = Int()
    let generator = UIImpactFeedbackGenerator(style: .light)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
        checkOrientation(frame: view.frame)
    }
    
    func checkOrientation(frame: CGRect) {
        
        if frame.height > frame.width {
            print("Portrait")
            setupPortraitView()
            
        }else{
            print("Landscape")
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
        
        let buttonView = PortraitButtonView(frame: frame)
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
                }
                if title == "↥" {
                    button.tag = 1
                    button.addTarget(self, action: #selector(upArrowPressed(sender:)), for: .touchUpInside)
                }
                if title == "↤" {
                    button.addTarget(self, action: #selector(removeNumber(sender:)), for: .touchUpInside)
                }
                if title == "+" || title == "-" || title == "x" || title == "÷" {
                    button.addTarget(self, action: #selector(symbolPressed(sender:)), for: .touchUpInside)
                }
                if title == "C" {
                    button.addTarget(self, action: #selector(cancelPressed(sender:)), for: .touchUpInside)
                }
                if title == "AC" {
                    button.addTarget(self, action: #selector(cancelAllPressed(sender:)), for: .touchUpInside)
                }
            }
        }
        
        setupNumbersView(view: buttonView)
        
    }
    
    
    
    //MARK: Remove number
    @objc func removeNumber(sender: UIButton) {
        generator.impactOccurred()

        let currentText = numbersView.firstValueLabel.text!
        let secondText = numbersView.secondValueLabel.text!
        let symbol = numbersView.symbolLabel.text!
        
        let (summary, firstString) = pressHandler.handleRemoveButton(currentText: currentText, secondText: secondText, symbol: symbol)
        numbersView.summaryValueLabel.text = summary
        numbersView.firstValueLabel.text = firstString
        
    }
    
    //MARK: CancelPressed
    @objc func cancelPressed(sender: UIButton) {
        generator.impactOccurred()

        numbersView.summaryValueLabel.text = ""
        numbersView.firstValueLabel.text = "0"
        numbersView.secondValueLabel.text = ""
        numbersView.symbolLabel.text = ""
        
    }
    
    //MARK: CancelAllPressed
    @objc func cancelAllPressed(sender: UIButton) {
        generator.impactOccurred()
        
        numbersView.summaryValueLabel.text = ""
        numbersView.firstValueLabel.text = "0"
        numbersView.secondValueLabel.text = ""
        numbersView.symbolLabel.text = ""
        historyView.historyLabel.text = ""
        counter = 0
    }
    
    
    //MARK: UpArrowPressed
    @objc func upArrowPressed(sender: UIButton) {
        generator.impactOccurred()

        let symbol = numbersView.symbolLabel.text!
        let currentText = numbersView.firstValueLabel.text!
        
        if symbol != "", currentText != "0", counter < 11 {
            
            let secondText = numbersView.secondValueLabel.text!
            let summaryText = numbersView.summaryValueLabel.text!
            let historyText = historyView.historyLabel.text!
            let newLine = currentText + " " + symbol + " " + secondText + " = " + summaryText
            
            historyView.historyLabel.text = historyText + "\n" + newLine

            numbersView.summaryValueLabel.text = ""
            numbersView.firstValueLabel.text = "0"
            numbersView.secondValueLabel.text = ""
            numbersView.symbolLabel.text = ""
            
            let bView = view.viewWithTag(1)
            bView?.viewWithTag(1)?.backgroundColor = Colors.redColor.withAlphaComponent(0.5)
            counter += 1
        }
        
        
    }
    
    //MARK: CommaPressed
    @objc func commaPressed(sender: UIButton) {
        generator.impactOccurred()

        let currentText = numbersView.firstValueLabel.text!
        
        if !currentText.contains(".") {
            let newText = currentText + ".0"
            numbersView.firstValueLabel.text! = newText
        }
        
    }
    
    //MARK: SymbolPressed
    @objc func symbolPressed(sender: UIButton) {
        generator.impactOccurred()
        
        if numbersView.firstValueLabel.text! != "0" {
            if numbersView.symbolLabel.text! == "" {
                
                let currentSymbol = sender.currentTitle!
                
                numbersView.secondValueLabel.text = numbersView.firstValueLabel.text!
                numbersView.firstValueLabel.text! = "0"
                
                if currentSymbol == "+" {
                    numbersView.symbolLabel.text = "+"
                }
                if currentSymbol == "-" {
                    numbersView.symbolLabel.text = "-"
                }
                if currentSymbol == "x" {
                    numbersView.symbolLabel.text = "x"
                }
                if currentSymbol == "÷" {
                    numbersView.symbolLabel.text = "÷"
                }
            }
        }
    }
    
    //MARK: NumberPressed
    @objc func numberPressed(sender: UIButton) {
        generator.impactOccurred()
        
        let currentText = numbersView.firstValueLabel.text!
        let secondText = numbersView.secondValueLabel.text!
        let symbol = numbersView.symbolLabel.text!
        let buttonPressed = sender.currentTitle!

        if currentText.count < 10 {
            (numbersView.summaryValueLabel.text, numbersView.firstValueLabel.text) = pressHandler.handleNumberPress(currentText: currentText, secondText: secondText, symbol: symbol, buttonPressed: buttonPressed)
            
            if numbersView.secondValueLabel.text! != "" {
                let bView = view.viewWithTag(1)
                bView?.viewWithTag(1)?.backgroundColor = Colors.redColor.withAlphaComponent(1)
            }
        }
        
    }
    
    //MARK:- Setup
//16 017
    
    
    
    
    func setupNumbersView(view: UIView) {
        numbersView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(numbersView)
        
        numbersView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive  = true
        numbersView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        numbersView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -5).isActive = true
        numbersView.topAnchor.constraint(equalTo: numbersView.secondValueLabel.topAnchor).isActive = true

        setupHistoryView()
        
    }
    
    func setupHistoryView() {
        
        historyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(historyView)
        
        historyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        historyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive  = true
        historyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        historyView.bottomAnchor.constraint(equalTo: numbersView.topAnchor, constant: -5).isActive = true
    }
    
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

//
//  ViewController.swift
//  Calculator
//
//  Created by Joakim Kajan on 10.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let sharedInstance = ViewController()
    
    let pressHandler = PressHandler()
    
    let numbersView = NumbersView()
    let historyView = HistoryView()
    var counter = Int()
    var history = String()

    let generator = UIImpactFeedbackGenerator(style: .light)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
        setupButtons()
        
    }
    
    func setupButtons() {
        let buttonView = ButtonView(frame: view.frame)
        buttonView.tag = 10
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonView)
        buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
        history = ""
        counter = 0
    }
    
    
    //MARK: UpArrowPressed
    @objc func upArrowPressed(sender: UIButton) {
        generator.impactOccurred()

        let operatorSymbol = numbersView.symbolLabel.text!
        let currentText = numbersView.firstValueLabel.text!
        
        if operatorSymbol != "", currentText != "0", counter < 11 {
            let firstText = numbersView.secondValueLabel.text!
            let secondText = numbersView.firstValueLabel.text!
            let summaryText = numbersView.summaryValueLabel.text!
            let temp1 = firstText + " " + operatorSymbol + " " + secondText
            let temp2 = " = " + summaryText
            let historyText = temp1 + temp2
            
            historyView.historyLabel.text = history + "\n" + historyText

            numbersView.summaryValueLabel.text = ""
            numbersView.firstValueLabel.text = "0"
            numbersView.secondValueLabel.text = ""
            numbersView.symbolLabel.text = ""
            history = history + "\n" + historyText
            
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
        
        numbersView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive  = true
        numbersView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        numbersView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -5).isActive = true
        numbersView.topAnchor.constraint(equalTo: numbersView.secondValueLabel.topAnchor).isActive = true

        setupHistoryView()
        
    }
    
    func setupHistoryView() {
        
        historyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(historyView)
        
        historyView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        historyView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive  = true
        historyView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        historyView.bottomAnchor.constraint(equalTo: numbersView.topAnchor, constant: -5).isActive = true
    }
    
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

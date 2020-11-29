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
    let actions = Actions()
    let calculate = Calculate()
    // Counter is for knowing the ammount of lines in historylabel (max 10 is allowed)
    var counter = Int()
    let generator = UIImpactFeedbackGenerator(style: .light)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        setupButtons(frame: view.frame)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let group = DispatchGroup()
        
        let firstNumberString = actions.fetchFirstNumberText(view: view)
        let secondNumberString = actions.fetchSecondNumberText(view: view)
        let symbol = actions.fetchSymbolText(view: view)
        let historyString = actions.fetchHistoryText(view: view)
        
        let btnViewToRemove = view.viewWithTag(ViewTags.buttonViewTag)!
        btnViewToRemove.removeFromSuperview()
        let numViewToRemove = view.viewWithTag(ViewTags.numbersViewTag)!
        numViewToRemove.removeFromSuperview()
        let hisViewToRemove = view.viewWithTag(ViewTags.historyViewTag)!
        hisViewToRemove.removeFromSuperview()
        view.layoutIfNeeded()
        
        // This if else stament is kept if needed in the future but both landscape and portrait do the same thing
        // maybe animations or such
        // ButtonView is created based on the frame sent to it
        if UIDevice.current.orientation.isLandscape {
            
            group.enter()
            DispatchQueue.main.async {
                self.setupButtons(frame: self.view.frame)
                group.leave()
            }
            
        }else {
            group.enter()
            DispatchQueue.main.async {
                self.setupButtons(frame: self.view.frame)
                group.leave()
            }
        }
        
        //Set the proper values back
        group.notify(queue: DispatchQueue.main) {

            if firstNumberString != "0" {
                let newFirstNumberLabel = self.view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
                newFirstNumberLabel.text = firstNumberString
                self.actions.activateButton(tag: ButtonTags.rightArrowButtonTag, view: self.view)
                self.actions.activateButton(tag: ButtonTags.cancelButtonTag, view: self.view)
                if secondNumberString != "" {

                    let newSecondNumberLabel = self.view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
                    newSecondNumberLabel.text = secondNumberString
                    let newSymbolLabel = self.view.viewWithTag(LabelTags.symboLabelTag) as! UILabel
                    newSymbolLabel.text = symbol
                    let newResultLabel = self.view.viewWithTag(LabelTags.resultValueLabelTag) as! UILabel
                    newResultLabel.text = self.calculate.handler(symbol: symbol, firstNumber: firstNumberString, secondNumber: secondNumberString)
                    
                    self.actions.activateButton(tag: ButtonTags.upArrowButtonTag, view: self.view)
                }
            }
            
            if historyString != "" {
                let newHistoryLabel = self.view.viewWithTag(LabelTags.historyLabelTag) as! UILabel
                newHistoryLabel.text = historyString
                self.actions.activateButton(tag: ButtonTags.cancelAllButtonTag, view: self.view)
            }
            
        }
        
        
    }
    
    func setupButtons(frame: CGRect) {
        
        let buttonView = ButtonView(frame: frame)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonView)
        buttonView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: buttonView.fullHeigth).isActive = true
        
        for view in buttonView.subviews {
            let button = view as! UIButton
            let title = button.currentTitle!
            
            if title.isInteger == true {
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
                }else if title == "a2" {
                    button.addTarget(self, action: #selector(exponentPressed(sender:)), for: .touchUpInside)
                }else if title == "ab" {
                    button.addTarget(self, action: #selector(exponentPressed(sender:)), for: .touchUpInside)
                }else if title == "(" {
                    button.addTarget(self, action: #selector(negativePositivePressed(sender:)), for: .touchUpInside)
                }else if title == ")" {
                    button.addTarget(self, action: #selector(negativePositivePressed(sender:)), for: .touchUpInside)
                }else if title == "sin" {
                    button.addTarget(self, action: #selector(negativePositivePressed(sender:)), for: .touchUpInside)
                }else if title == "cos" {
                    button.addTarget(self, action: #selector(negativePositivePressed(sender:)), for: .touchUpInside)
                }else if title == "tan" {
                    button.addTarget(self, action: #selector(negativePositivePressed(sender:)), for: .touchUpInside)
                }
            }
        }
        setupNumbersView(buttonView: buttonView)
        
    }
    
    
    //MARK: Remove number
    @objc func removeNumber(sender: UIButton) {
        generator.impactOccurred()
        pressHandler.removePressed(view: view)
        
    }
    
    //MARK: CancelPressed
    @objc func cancelPressed(sender: UIButton) {
        generator.impactOccurred()
        pressHandler.cancelPressed(view: view)
        
    }
    
    //MARK: CancelAllPressed
    @objc func cancelAllPressed(sender: UIButton) {
        generator.impactOccurred()
        pressHandler.cancelAllPressed(view: view)
        counter = 0
        
    }
    
    //MARK: UpArrowPressed
    @objc func upArrowPressed(sender: UIButton) {
        generator.impactOccurred()
        pressHandler.historyPressed(view: view)
        counter += 1
    }
    
    //MARK: Negative Positive change
    @objc func negativePositivePressed(sender: UIButton) {
        generator.impactOccurred()
        pressHandler.negativePositivePressed(view: view)
        
    }
    
    //MARK: CommaPressed
    @objc func commaPressed(sender: UIButton) {
        generator.impactOccurred()
        pressHandler.commaPressed(view: view)
        
    }
    
    //MARK: SymbolPressed
    @objc func symbolPressed(sender: UIButton) {
        generator.impactOccurred()
        pressHandler.symbolPressed(buttonPressed: sender.currentTitle!, view: view)
        
    }
    
    //MARK: NumberPressed
    @objc func numberPressed(sender: UIButton) {
        generator.impactOccurred()
        pressHandler.numberPressed(buttonPressed: sender.currentTitle!, view: view)
        
    }
    
    //MARK: Exponent pressed
    @objc func exponentPressed(sender: UIButton) {
        generator.impactOccurred()
        pressHandler.exponentPressed(buttonPressed: sender.currentTitle!, view: view)
        
    }
    
    
    //MARK:- Setup
    
    
    func setupNumbersView(buttonView: UIView) {
        
        let numbersView = NumbersView(frame: view.frame)
        numbersView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(numbersView)
        numbersView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive  = true
        numbersView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        numbersView.bottomAnchor.constraint(equalTo: buttonView.topAnchor, constant: -10).isActive = true
        
        setupHistoryView(numbersView: numbersView)
        
    }
    
    func setupHistoryView(numbersView: UIView) {
        
        let historyView = HistoryView(frame: view.frame)
        historyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(historyView)
        historyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive  = true
        historyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        if view.frame.height > view.frame.width {
            // Portrait
            historyView.bottomAnchor.constraint(equalTo: numbersView.topAnchor, constant: -25).isActive = true
            historyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true

        }else{
            // Landscape
            historyView.bottomAnchor.constraint(equalTo: numbersView.bottomAnchor, constant: 0).isActive = true
            historyView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true

        }
        
    }
    
}


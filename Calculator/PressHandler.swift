//
//  PressHandler.swift
//  Calculator
//
//  Created by Joakim Kajan on 11.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import Foundation
import UIKit

class PressHandler: NSObject {
    
    static let sharedInstance = PressHandler()
    let actions = Actions()
    let calculate = Calculate()
    
    
    //MARK:- Remove pressed
    func removePressed(view: UIView) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!
        let secondNumberLabel = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let secondText = secondNumberLabel.text!
        let symbolLabel = view.viewWithTag(LabelTags.symboLabelTag) as! UILabel
        let symbol = symbolLabel.text!
        
        let resultLabel = view.viewWithTag(LabelTags.resultValueLabelTag) as! UILabel
        
        //TODO: Make this more clear
        if currentText.contains(".") {
            (resultLabel.text, firstNumberLabel.text) = removeComma(currentText: currentText, secondText: secondText, symbol: symbol)
        }else if secondText == "" {
            firstNumberLabel.text = dropFromString(currentText: currentText, dropAmmount: 1)
        }else{
            firstNumberLabel.text = dropFromString(currentText: currentText, dropAmmount: 1)
            resultLabel.text = calculate.handler(symbol: symbol, currentText: firstNumberLabel.text!, secondText: secondText)
        }
        
        if currentText.count == 1 {
            firstNumberLabel.text = "0"
            resultLabel.text = ""
            actions.deactivateButton(tag: ButtonTags.rightArrowButtonTag, view: view)
            if secondText != "" {
                actions.deactivateButton(tag: ButtonTags.upArrowButtonTag, view: view)
            }else{
                actions.deactivateButton(tag: ButtonTags.cancelButtonTag, view: view)
            }
        }
        
        if !currentText.contains(".") {
            actions.activateButton(tag: ButtonTags.dotButtonTag, view: view)
        }
    }
    
    
    //MARK: Remove comma
    func removeComma(currentText: String, secondText: String, symbol: String) -> (result: String, firstString: String) {
        var result = String()
        var firstString = String()
        
        let comma = currentText.split(separator: ".")
        let slice = comma[1]
        
        if slice.count == 1 {
            firstString = dropFromString(currentText: currentText, dropAmmount: 2)
            result = calculate.handler(symbol: symbol, currentText: firstString, secondText: secondText)
        }else{
            firstString = dropFromString(currentText: currentText, dropAmmount: 1)
            result = calculate.handler(symbol: symbol, currentText: firstString, secondText: secondText)
        }
        return (result: result, firstString: firstString)
    }
    
    
    //MARK: Drop n from string
    func dropFromString(currentText: String, dropAmmount: Int) -> String {
        let firstString = String(currentText.dropLast(dropAmmount))
        return firstString
        
    }
    
    
    
    
    //MARK: Negative or positive pressed
    func negativePositivePressed(view: UIView) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!
        
        if currentText.contains("-") {
            firstNumberLabel.text = String(currentText.dropFirst())
        }else{
            firstNumberLabel.text = "-" + currentText
        }
    }
    
    
    //MARK: Comma pressed
    func commaPressed(view: UIView) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!
        
        if !currentText.contains(".") {
            let newText = currentText + ".0"
            firstNumberLabel.text! = newText
            
            actions.deactivateButton(tag: ButtonTags.dotButtonTag, view: view)
        }
        
    }
    
    //MARK: Number pressed
    func numberPressed(buttonPressed: String, view: UIView) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!
        let secondNumberLabel = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let secondText = secondNumberLabel.text!
        let symbolLabel = view.viewWithTag(LabelTags.symboLabelTag) as! UILabel
        let symbol = symbolLabel.text!
        let resultLabel = view.viewWithTag(LabelTags.resultValueLabelTag) as! UILabel
        
        let button = view.viewWithTag(ButtonTags.powerOfBTag) as? UIButton
        
        // Check if ab exponentButton is active. If so, create attributed string and set it to label
        if button?.backgroundColor == Colors.redColor {
            let font:UIFont? = UIFont.boldSystemFont(ofSize: FontSize.landscapeButtonFontSize)
            let fontSuper:UIFont? = UIFont.boldSystemFont(ofSize: FontSize.landscapeButtonFontSize / 2)
            
            resultLabel.text = calculate.handler(symbol: "ab", currentText: currentText, secondText: buttonPressed)
            
            // This needs to be better. extension or separate function
            let attString:NSMutableAttributedString = NSMutableAttributedString(string: currentText + buttonPressed, attributes: [NSAttributedString.Key.font:font!])
            attString.setAttributes([NSAttributedString.Key.font:fontSuper!,NSAttributedString.Key.baselineOffset:10], range: NSRange(location:1,length:1))
            firstNumberLabel.attributedText = attString
        }
        
        
        if currentText.count < 10 {
            
            if currentText == "-0" {
                firstNumberLabel.text = String(currentText.dropLast(1)) + buttonPressed
                if secondText != "" {
                    resultLabel.text = calculate.handler(symbol: symbol, currentText: firstNumberLabel.text!, secondText: secondText)
                }
            }else if !currentText.contains(".0") {
                
                if currentText != "0" {
                    firstNumberLabel.text = currentText + buttonPressed
                    if secondText != "" {
                        resultLabel.text = calculate.handler(symbol: symbol, currentText: firstNumberLabel.text!, secondText: secondText)
                    }
                }else{
                    firstNumberLabel.text = buttonPressed
                    if secondText != "" {
                        resultLabel.text = calculate.handler(symbol: symbol, currentText: firstNumberLabel.text!, secondText: secondText)
                    }
                }
                
            }else{
                let split = currentText.split(separator: ".")
                let splitCount = split[1]
                if buttonPressed == "0" {
                    firstNumberLabel.text = currentText + buttonPressed
                    if secondText != "" {
                        resultLabel.text = calculate.handler(symbol: symbol, currentText: firstNumberLabel.text!, secondText: secondText)
                    }
                }else if splitCount.count > 1 {
                    firstNumberLabel.text = currentText + buttonPressed
                    if secondText != "" {
                        resultLabel.text = calculate.handler(symbol: symbol, currentText: firstNumberLabel.text!, secondText: secondText)
                    }
                }else{
                    firstNumberLabel.text = dropFromString(currentText: currentText, dropAmmount: 1) + buttonPressed
                    if secondText != "" {
                        resultLabel.text = calculate.handler(symbol: symbol, currentText: firstNumberLabel.text!, secondText: secondText)
                    }
                }
            }
            
            if secondNumberLabel.text! != "" {
                actions.activateButton(tag: ButtonTags.upArrowButtonTag, view: view)
            }
            if firstNumberLabel.text != "0" {
                actions.activateButton(tag: ButtonTags.rightArrowButtonTag, view: view)
                actions.activateButton(tag: ButtonTags.cancelButtonTag, view: view)
            }
        }
        
    }
    
    //MARK: Exponent pressed
    func exponentPressed(buttonPressed: String, view: UIView) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!
        let summaryLabel = view.viewWithTag(LabelTags.resultValueLabelTag) as! UILabel
        
        
        if buttonPressed == "a2" {
            summaryLabel.text = calculate.handler(symbol: buttonPressed, currentText: currentText, secondText: "")
            let font:UIFont? = UIFont.boldSystemFont(ofSize: FontSize.landscapeButtonFontSize)
            let fontSuper:UIFont? = UIFont.boldSystemFont(ofSize: FontSize.landscapeButtonFontSize / 2)
            
            // This needs to be solved out somehow..
            let attString:NSMutableAttributedString = NSMutableAttributedString(string: currentText + currentText, attributes: [NSAttributedString.Key.font:font!])
            attString.setAttributes([NSAttributedString.Key.font:fontSuper!,NSAttributedString.Key.baselineOffset:10], range: NSRange(location:1,length:1))
            firstNumberLabel.attributedText = attString
        }else if buttonPressed == "ab" {
            actions.changeButtonColor(tag: ButtonTags.powerOfBTag, view: view)
        }
        
    }
    
    
    
    //MARK: History pressed
    func historyPressed(view: UIView) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!
        let secondNumberLabel = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let secondText = secondNumberLabel.text!
        let resultLabel = view.viewWithTag(LabelTags.resultValueLabelTag) as! UILabel
        let resultText = resultLabel.text!
        let symbolLabel = view.viewWithTag(LabelTags.symboLabelTag) as! UILabel
        let symbol = symbolLabel.text!
        let historyLabel = view.viewWithTag(LabelTags.historyLabelTag) as! UILabel
        let historyText = historyLabel.text!
        let newLine = secondText + " " + symbol + " " + currentText + " = " + resultText
        
        historyLabel.text = historyText + "\n" + newLine
        actions.resetLabels(resetAll: false, view: view)
        
        actions.deactivateButton(tag: ButtonTags.upArrowButtonTag, view: view)
        actions.deactivateButton(tag: ButtonTags.rightArrowButtonTag, view: view)
        actions.deactivateButton(tag: ButtonTags.cancelButtonTag, view: view)
        actions.activateButton(tag: ButtonTags.cancelAllButtonTag, view: view)
        
    }
    
    
    //MARK: Cancel all pressed
    func cancelAllPressed(view: UIView) {
        
        let label = view.viewWithTag(LabelTags.historyLabelTag) as! UILabel
        label.text = ""
        actions.resetLabels(resetAll: true, view: view)
        
        actions.deactivateButton(tag: ButtonTags.upArrowButtonTag, view: view)
        actions.deactivateButton(tag: ButtonTags.rightArrowButtonTag, view: view)
        actions.deactivateButton(tag: ButtonTags.cancelButtonTag, view: view)
        actions.deactivateButton(tag: ButtonTags.cancelAllButtonTag, view: view)
        
    }
    
    
    //MARK: Cancel pressed
    func cancelPressed(view: UIView) {
        
        actions.resetLabels(resetAll: false, view: view)
        
        actions.deactivateButton(tag: ButtonTags.upArrowButtonTag, view: view)
        actions.deactivateButton(tag: ButtonTags.rightArrowButtonTag, view: view)
        actions.deactivateButton(tag: ButtonTags.cancelButtonTag, view: view)
        actions.activateButton(tag: ButtonTags.dotButtonTag, view: view)
        
        //Temp for now
        actions.activateButton(tag: ButtonTags.powerOfBTag, view: view)
        
    }
    
    
    
    
    
    //MARK: Symbol pressed
    func symbolPressed(buttonPressed: String, view: UIView) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let currentText = firstNumberLabel.text!
        let secondNumberLabel = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let secondText = secondNumberLabel.text!
        let symbolLabel = view.viewWithTag(LabelTags.symboLabelTag) as! UILabel
        
        if currentText != "0", secondText == "" {
            
            symbolLabel.text = buttonPressed
            secondNumberLabel.text = firstNumberLabel.text!
            firstNumberLabel.text! = "0"
            
            actions.deactivateButton(tag: ButtonTags.rightArrowButtonTag, view: view)
            
        }
    }
    
    
}

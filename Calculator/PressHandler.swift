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
    
    let actions = Actions()
    let calculate = Calculate()
    
    
    //MARK:- Remove pressed
    func removePressed(view: UIView) {
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let firstNumberString = firstNumberLabel.text!
        let secondNumberString = actions.fetchSecondNumberText(view: view)
        let symbolString = actions.fetchSymbolText(view: view)
        
        let resultLabel = view.viewWithTag(LabelTags.resultValueLabelTag) as! UILabel
        
        //TODO: Make this more clear
        if firstNumberString.contains(".") {
            (resultLabel.text, firstNumberLabel.text) = removeComma(firstNumberString: firstNumberString, secondNumberString: secondNumberString, symbolString: symbolString)
        }else if secondNumberString == "" {
            firstNumberLabel.text = dropFromString(currentText: firstNumberString, dropAmmount: 1)
        }else{
            firstNumberLabel.text = dropFromString(currentText: firstNumberString, dropAmmount: 1)
            resultLabel.text = calculate.handler(symbol: symbolString, firstNumber: firstNumberLabel.text!, secondNumber: secondNumberString)
        }
        
        if firstNumberString.count == 1 {
            firstNumberLabel.text = "0"
            resultLabel.text = ""
            actions.deactivateButton(tag: ButtonTags.rightArrowButtonTag, view: view)
            if secondNumberString != "" {
                actions.deactivateButton(tag: ButtonTags.upArrowButtonTag, view: view)
            }else{
                actions.deactivateButton(tag: ButtonTags.cancelButtonTag, view: view)
            }
        }
        
        if !firstNumberString.contains(".") {
            actions.activateButton(tag: ButtonTags.dotButtonTag, view: view)
        }
    }
    
    
    //MARK: Remove comma
    func removeComma(firstNumberString: String, secondNumberString: String, symbolString: String) -> (result: String, firstString: String) {
        var result = String()
        var newFirstString = String()
        
        let comma = firstNumberString.split(separator: ".")
        let slice = comma[1]
        
        if slice.count == 1 {
            newFirstString = dropFromString(currentText: firstNumberString, dropAmmount: 2)
            result = calculate.handler(symbol: symbolString, firstNumber: newFirstString, secondNumber: secondNumberString)
        }else{
            newFirstString = dropFromString(currentText: firstNumberString, dropAmmount: 1)
            result = calculate.handler(symbol: symbolString, firstNumber: newFirstString, secondNumber: secondNumberString)
        }
        return (result: result, firstString: newFirstString)
    }
    
    
    //MARK: Drop n from string
    func dropFromString(currentText: String, dropAmmount: Int) -> String {
        let firstString = String(currentText.dropLast(dropAmmount))
        return firstString
        
    }
    
    
    
    
    //MARK: Negative or positive pressed
    func negativePositivePressed(view: UIView) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let firstNumberString = firstNumberLabel.text!
        
        if firstNumberString.contains("-") {
            firstNumberLabel.text = String(firstNumberString.dropFirst())
        }else{
            firstNumberLabel.text = "-" + firstNumberString
        }
    }
    
    
    //MARK: Comma pressed
    func commaPressed(view: UIView) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let firstNumberString = firstNumberLabel.text!
        
        if !firstNumberString.contains(".") {
            let newText = firstNumberString + ".0"
            firstNumberLabel.text! = newText
            
            actions.deactivateButton(tag: ButtonTags.dotButtonTag, view: view)
        }
        
    }
    
    //MARK: Number pressed
    func numberPressed(buttonPressed: String, view: UIView) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let firstNumberString = firstNumberLabel.text!
        let secondNumberString = actions.fetchSecondNumberText(view: view)
        let symbolString = actions.fetchSymbolText(view: view)
        let resultLabel = view.viewWithTag(LabelTags.resultValueLabelTag) as! UILabel
        
        let button = view.viewWithTag(ButtonTags.powerOfBTag) as? UIButton
        
        // Check if ab exponentButton is active. If so, create attributed string and set it to label
        if button?.backgroundColor == Colors.redColor {
            let font:UIFont? = UIFont.boldSystemFont(ofSize: FontSize.landscapeButtonFontSize)
            let fontSuper:UIFont? = UIFont.boldSystemFont(ofSize: FontSize.landscapeButtonFontSize / 2)
            
            resultLabel.text = calculate.handler(symbol: "ab", firstNumber: firstNumberString, secondNumber: buttonPressed)
            
            // This needs to be better. extension or separate function
            let attString:NSMutableAttributedString = NSMutableAttributedString(string: firstNumberString + buttonPressed, attributes: [NSAttributedString.Key.font:font!])
            attString.setAttributes([NSAttributedString.Key.font:fontSuper!,NSAttributedString.Key.baselineOffset:10], range: NSRange(location:1,length:1))
            firstNumberLabel.attributedText = attString
        }
        
        
        if firstNumberString.count < 10 {
            
            if firstNumberString == "-0" {
                firstNumberLabel.text = String(firstNumberString.dropLast(1)) + buttonPressed
                if secondNumberString != "" {
                    resultLabel.text = calculate.handler(symbol: symbolString, firstNumber: firstNumberLabel.text!, secondNumber: secondNumberString)
                }
            }else if !firstNumberString.contains(".0") {
                
                if firstNumberString != "0" {
                    firstNumberLabel.text = firstNumberString + buttonPressed
                    if secondNumberString != "" {
                        resultLabel.text = calculate.handler(symbol: symbolString, firstNumber: firstNumberLabel.text!, secondNumber: secondNumberString)
                    }
                }else{
                    firstNumberLabel.text = buttonPressed
                    if secondNumberString != "" {
                        resultLabel.text = calculate.handler(symbol: symbolString, firstNumber: firstNumberLabel.text!, secondNumber: secondNumberString)
                    }
                }
                
            }else{
                let split = firstNumberString.split(separator: ".")
                let splitCount = split[1]
                if buttonPressed == "0" {
                    firstNumberLabel.text = firstNumberString + buttonPressed
                    if secondNumberString != "" {
                        resultLabel.text = calculate.handler(symbol: symbolString, firstNumber: firstNumberLabel.text!, secondNumber: secondNumberString)
                    }
                }else if splitCount.count > 1 {
                    firstNumberLabel.text = firstNumberString + buttonPressed
                    if secondNumberString != "" {
                        resultLabel.text = calculate.handler(symbol: symbolString, firstNumber: firstNumberLabel.text!, secondNumber: secondNumberString)
                    }
                }else{
                    firstNumberLabel.text = dropFromString(currentText: firstNumberString, dropAmmount: 1) + buttonPressed
                    if secondNumberString != "" {
                        resultLabel.text = calculate.handler(symbol: symbolString, firstNumber: firstNumberLabel.text!, secondNumber: secondNumberString)
                    }
                }
            }
            
            if secondNumberString != "" {
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
        let firstNumberString = firstNumberLabel.text!
        let resultLabel = view.viewWithTag(LabelTags.resultValueLabelTag) as! UILabel
        
        
        if buttonPressed == "a2" {
            resultLabel.text = calculate.handler(symbol: buttonPressed, firstNumber: firstNumberString, secondNumber: "")
            let font:UIFont? = UIFont.boldSystemFont(ofSize: FontSize.landscapeButtonFontSize)
            let fontSuper:UIFont? = UIFont.boldSystemFont(ofSize: FontSize.landscapeButtonFontSize / 2)
            
            // This needs to be solved out somehow..
            let attString:NSMutableAttributedString = NSMutableAttributedString(string: firstNumberString + firstNumberString, attributes: [NSAttributedString.Key.font:font!])
            attString.setAttributes([NSAttributedString.Key.font:fontSuper!,NSAttributedString.Key.baselineOffset:10], range: NSRange(location:1,length:1))
            firstNumberLabel.attributedText = attString
        }else if buttonPressed == "ab" {
            actions.changeButtonColor(tag: ButtonTags.powerOfBTag, view: view)
        }
        
    }
    
    
    
    //MARK: History pressed
    func historyPressed(view: UIView) {
        
        let firstNumberString = actions.fetchFirstNumberText(view: view)
        let secondNumberString = actions.fetchSecondNumberText(view: view)
        let resultString = actions.fetchResultValueText(view: view)
        let symbolString = actions.fetchSymbolText(view: view)
        let historyLabel = view.viewWithTag(LabelTags.historyLabelTag) as! UILabel
        let historyString = historyLabel.text!
        let newLine = secondNumberString + " " + symbolString + " " + firstNumberString + " = " + resultString
        
        historyLabel.text = historyString + "\n" + newLine
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
        let firstNumberString = firstNumberLabel.text!
        let secondNumberLabel = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let secondNumberString = secondNumberLabel.text!
        let symbolLabel = view.viewWithTag(LabelTags.symboLabelTag) as! UILabel
        
        if firstNumberString != "0", secondNumberString == "" {
            
            symbolLabel.text = buttonPressed
            secondNumberLabel.text = firstNumberLabel.text!
            firstNumberLabel.text! = "0"
            
            actions.deactivateButton(tag: ButtonTags.rightArrowButtonTag, view: view)
            
        }
    }
    
    
}

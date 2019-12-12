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
    
    
    
    //MARK:- HandleRemoveButton
    func handleRemoveButton(currentText: String, secondText: String, symbol: String) -> (summary: String, firstString: String) {
        var summary = String()
        var firstString = String()
        
        if currentText != "0", currentText.count != 1 {
            
            if currentText.contains(".") {
                (summary, firstString) = hasComma(currentText: currentText, secondText: secondText, symbol: symbol)
                
            }else{
                firstString = dropFromString(currentText: currentText, dropAmmount: 1)
                summary = calculate(symbol: symbol, currentText: firstString, secondText: secondText)
            }
            
        }else{
            summary = ""
            firstString = "0"
        }
        return (summary: summary, firstString: firstString)
    }
    
    func calculate(symbol: String, currentText: String, secondText: String) -> String {
        var summary = Double()
        var stringSummary = String()
        let firstValue = Double(currentText) ?? 0.0
        let secondValue = Double(secondText) ?? 0.0
        
        
        if symbol == "+" {
            summary = firstValue + secondValue
        }
        if symbol == "-" {
            summary = firstValue - secondValue
        }
        if symbol == "x" {
            summary = firstValue * secondValue
        }
        if symbol == "÷" {
            summary = firstValue / secondValue
        }
        
        let isInt = floor(summary) == summary
        if isInt == true {
            let intSummary = Int(summary)
            stringSummary = String(intSummary)
        }else{
            let doubleSummary = summary
            stringSummary = String(doubleSummary)
        }
        return stringSummary
    }
    
    
    func hasComma(currentText: String, secondText: String, symbol: String) -> (summary: String, firstString: String) {
        var summary = String()
        var firstString = String()
        
        let comma = currentText.split(separator: ".")
        let slice = comma[1]
        
        if slice.count == 1 {
            firstString = dropFromString(currentText: currentText, dropAmmount: 2)
            summary = calculate(symbol: symbol, currentText: firstString, secondText: secondText)
        }else{
            firstString = dropFromString(currentText: currentText, dropAmmount: 1)
            summary = calculate(symbol: symbol, currentText: firstString, secondText: secondText)
        }
        return (summary: summary, firstString: firstString)
    }
    
    func dropFromString(currentText: String, dropAmmount: Int) -> String {
        let firstString = String(currentText.dropLast(dropAmmount))
        return firstString
        
    }
    
    
    
    
    
    
    
    
    //MARK: HandleNumberPress
    func handleNumberPress(currentText: String, secondText: String, symbol: String, buttonPressed: String) -> (summary: String, firstString: String) {
        
        var summary = String()
        var firstString = String()
        
        if !currentText.contains(".0") {
            
            if currentText != "0" {
                firstString = currentText + buttonPressed
                if secondText != "" {
                    summary = calculate(symbol: symbol, currentText: firstString, secondText: secondText)
                }
            }else{
                firstString = buttonPressed
                if secondText != "" {
                    summary = calculate(symbol: symbol, currentText: firstString, secondText: secondText)
                }
            }
            
        }else{
            let split = currentText.split(separator: ".")
            let splitCount = split[1]
            if buttonPressed == "0" {
                firstString = currentText + buttonPressed
                if secondText != "" {
                    summary = calculate(symbol: symbol, currentText: firstString, secondText: secondText)
                }
            }else if splitCount.count > 1 {
                firstString = currentText + buttonPressed
                if secondText != "" {
                    summary = calculate(symbol: symbol, currentText: firstString, secondText: secondText)
                }
            }else{
                firstString = dropFromString(currentText: currentText, dropAmmount: 1) + buttonPressed
                if secondText != "" {
                    summary = calculate(symbol: symbol, currentText: firstString, secondText: secondText)
                }
            }
        }
        
        return (summary: summary, firstString: firstString)
    }
    
    
}

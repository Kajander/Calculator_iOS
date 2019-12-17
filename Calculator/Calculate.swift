//
//  Calculate.swift
//  Calculator
//
//  Created by Joakim Kajan on 17.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import Foundation

class Calculate {
    
    //MARK: Handler
    func handler(symbol: String, currentText: String, secondText: String) -> String {
        var result = Double()
        let firstValue = Double(currentText) ?? 0.0
        let secondValue = Double(secondText) ?? 0.0
        
        switch symbol {
        case "+":
            result = addition(firstValue: firstValue, secondValue: secondValue)
        case "-":
            result = subtraction(firstValue: firstValue, secondValue: secondValue)
        case "x":
            result = multiplication(firstValue: firstValue, secondValue: secondValue)
        case "÷":
            result = division(firstValue: firstValue, secondValue: secondValue)
        case "a2":
            result = powerOfTWo(firstValue: firstValue)
        case "ab":
            result = powerOfB(firstValue: firstValue, secondValue: secondValue)
        default:
            print("No symbol?")
            
        }
        
        return String(result)
        
    }
    
    
    
    
    
    
    //MARK: Addition
    func addition(firstValue: Double, secondValue: Double) -> Double {
        let summary = secondValue + firstValue
        return summary
    }
    
    //MARK: Subtraction
    func subtraction(firstValue: Double, secondValue: Double) -> Double {
        let summary = secondValue - firstValue
        return summary
    }
    
    //MARK: Multiplication
    func multiplication(firstValue: Double, secondValue: Double) -> Double {
        let summary = secondValue * firstValue
        return summary
    }
    
    //MARK: Division
    func division(firstValue: Double, secondValue: Double) -> Double {
        let summary = secondValue / firstValue
        return summary
    }
    
    //MARK: Power of two
    func powerOfTWo(firstValue: Double) -> Double {
        let summary = pow(firstValue, firstValue)
        return summary
    }
    
    //MARK: Power of b
    func powerOfB(firstValue: Double, secondValue: Double) -> Double {
        let summary = pow(firstValue, secondValue)
        return summary
    }
    
    
}

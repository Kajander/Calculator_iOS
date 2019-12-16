//
//  Constants.swift
//  Calculator
//
//  Created by Joakim Kajan on 10.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    static let backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
    static let whiteColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
    static let redColor = UIColor(red:0.75, green:0.22, blue:0.17, alpha:1.0)
    static let purpleColor = UIColor(red:0.56, green:0.22, blue:0.40, alpha:1.0)
    static let greenColor = UIColor(red:0.38, green:0.61, blue:0.54, alpha:1.0)
    static let activeAlpha = CGFloat(1.0)
    static let inactiveAlpha = CGFloat(0.6)
}

struct ButtonTitles {
    static let basicTitles = ["0", "1" ,"2" ,"3" ,"4" ,"5" ,"6" ,"7" ,"8" ,"9" ,"-/+", "↥" , ".", "+", "-", "x", "÷", "÷", "⇥", "C", "AC"]
    // More coming
    static let scientificTitles = ["a2", "ab", "(", ")", "sin", "cos", "tan"]
}
struct LabelTitles {
    static let tags = ["1", "2","3" ,"4" ,"5"]
}

struct LabelTags {
    static let firstValueLabelTag = 31
    static let secondValueLabelTag = 32
    static let summaryValueLabelTag = 33
    
    static let summarySymbolLabelTag = 34
    static let symboLabelTag = 35
    
    static let historyLabelTag = 36

}

struct ButtonTags {
    
    static let upArrowButtonTag = 1
    static let dotButtonTag = 2
    static let rightArrowButtonTag = 3
    static let cancelButtonTag = 4
    static let cancelAllButtonTag = 5
    
}


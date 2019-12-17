//
//  Actions.swift
//  Calculator
//
//  Created by Joakim Kajan on 16.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import Foundation
import UIKit

class Actions {
    
    
    //MARK: ActivateButton
    func activateButton(tag: Int, view: UIView) {
        let button = view.viewWithTag(tag) as? UIButton
        button?.isUserInteractionEnabled = true
        
        if ButtonTags.upArrowButtonTag == tag {
            button?.backgroundColor = Colors.redColor.withAlphaComponent(Colors.activeAlpha)
        }else if ButtonTags.dotButtonTag == tag {
            button?.backgroundColor = Colors.whiteColor.withAlphaComponent(Colors.activeAlpha)
        }else if ButtonTags.powerOfBTag == tag {
            button?.backgroundColor = Colors.whiteColor.withAlphaComponent(Colors.activeAlpha)
        }else{
            button?.backgroundColor = Colors.purpleColor.withAlphaComponent(Colors.activeAlpha)
        }
        
    }
    
    //MAKR: DeactivateButton
    func deactivateButton(tag: Int, view: UIView) {
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
    
    func changeButtonColor(tag: Int, view: UIView) {
        let button = view.viewWithTag(tag) as! UIButton
        button.backgroundColor = Colors.redColor.withAlphaComponent(Colors.activeAlpha)

    }
       
    //MARK: Reset Labels
    func resetLabels(resetAll: Bool, view: UIView) {
        
        let firstNumberLabel = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let secondNumberLabel = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let summaryLabel = view.viewWithTag(LabelTags.resultValueLabelTag) as! UILabel
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
    
    

    //MARK: Fetch firstNumberLabel.text
    func fetchFirstNumberText(view: UIView) -> String {
        let label = view.viewWithTag(LabelTags.firstValueLabelTag) as! UILabel
        let text = label.text ?? ""
        return text
    }
    
    //MARK: Fetch secondNumberLabel.text
    func fetchSecondNumberText(view: UIView) -> String {
        let label = view.viewWithTag(LabelTags.secondValueLabelTag) as! UILabel
        let text = label.text ?? ""
        return text
    }
    
    //MARK: Fetch resultValueLabel.text
    func fetchResultValueText(view: UIView) -> String {
        let label = view.viewWithTag(LabelTags.resultValueLabelTag) as! UILabel
        let text = label.text ?? ""
        return text
    }
    
    //MARK: Fetch symbolLabel.text
    func fetchSymbolText(view: UIView) -> String {
        let label = view.viewWithTag(LabelTags.symboLabelTag) as! UILabel
        let text = label.text ?? ""
        return text
    }
    
    //MARK: Fetch historyLabel.text
    func fetchHistoryText(view: UIView) -> String {
        let label = view.viewWithTag(LabelTags.historyLabelTag) as! UILabel
        let text = label.text ?? ""
        return text
    }
    
    
   
    
    
    
    
    
    
}

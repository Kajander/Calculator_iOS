//
//  NumbersView.swift
//  Calculator
//
//  Created by Joakim Kajan on 12.12.2019.
//  Copyright © 2019 JapeSoft. All rights reserved.
//

import UIKit

class NumbersView: UIView {
    
    var firstValueLabel = UILabel()
    var secondValueLabel = UILabel()
    var symbolLabel = UILabel()
    var summarySymbolLabel = UILabel()
    var summaryValueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        summarySymbolLabel = SummarySymbolLabel(frame: CGRect.zero, value: "=")
        setupSummarySymbolLabelConstraints()
        
        summaryValueLabel = SummaryValueLabel(frame: CGRect.zero, value: "")
        setupSummaryValueLabelConstraints()
        
        firstValueLabel = FirstValueLabel(frame: CGRect.zero, value: "0")
        setupFirstLabelConstraints()
        
        secondValueLabel = SecondValueLabel(frame: CGRect.zero, value: "")
        setupSecondLabelConstraints()
        
        symbolLabel = SymbolLabel(frame: CGRect.zero, value: "")
        setupSymbolLabelConstraints()
        
        setupLine()
    }
    
    func setupSummarySymbolLabelConstraints() {
        summarySymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(summarySymbolLabel)
        summarySymbolLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        summarySymbolLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        summarySymbolLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupSummaryValueLabelConstraints() {
        summaryValueLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(summaryValueLabel)
        summaryValueLabel.leadingAnchor.constraint(equalTo: summarySymbolLabel.trailingAnchor, constant: 5).isActive = true
        summaryValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        summaryValueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupFirstLabelConstraints() {
        firstValueLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(firstValueLabel)
        firstValueLabel.leadingAnchor.constraint(equalTo: summarySymbolLabel.trailingAnchor, constant: 5).isActive = true
        firstValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        firstValueLabel.bottomAnchor.constraint(equalTo: summarySymbolLabel.topAnchor, constant: -5).isActive = true
        
    }
    
    func setupSecondLabelConstraints() {
        secondValueLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(secondValueLabel)
        secondValueLabel.leadingAnchor.constraint(equalTo: summarySymbolLabel.trailingAnchor, constant: 5).isActive = true
        secondValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        secondValueLabel.bottomAnchor.constraint(equalTo: firstValueLabel.topAnchor, constant: -5).isActive = true
    }
    
    
    func setupSymbolLabelConstraints() {
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(symbolLabel)
        symbolLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        symbolLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        symbolLabel.bottomAnchor.constraint(equalTo: firstValueLabel.bottomAnchor).isActive = true
    }
    
    
    
    func setupLine(){
        let lineView = UIView()
        lineView.backgroundColor = .white
        lineView.layer.cornerRadius = 2
        lineView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lineView)
        lineView.leadingAnchor.constraint(equalTo: self.summarySymbolLabel.trailingAnchor, constant: 5).isActive = true
        lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        lineView.bottomAnchor.constraint(equalTo: self.summarySymbolLabel.topAnchor, constant: 0).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

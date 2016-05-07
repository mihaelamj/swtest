//
//  ViewController.swift
//  Calculator
//
//  Created by Mihaela Mihaljevic Jakic on 07/05/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel! //implicitly unwrapped optional
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
//        print("touched \(digit) digit")
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit;
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double { //computed property
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
}


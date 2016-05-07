//
//  ViewController.swift
//  Calculator
//
//  Created by Mihaela Mihaljevic Jakic on 07/05/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel! //implicitly unwrapped optional
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(sender: UIButton) {
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
    
    var displayValue: Double { //computed property
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

    @IBAction func performOperation(sender: UIButton) {
        if let mathematicalSymbol = sender.currentTitle {
            userIsInTheMiddleOfTyping = false
            
            if mathematicalSymbol == "π" {
                displayValue = M_PI
            } else if mathematicalSymbol == "√" {
                displayValue = sqrt(displayValue)
            }
            
        }
    }
}


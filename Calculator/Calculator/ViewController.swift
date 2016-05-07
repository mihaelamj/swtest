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
    
    var userIsinTheMiddleOfTyping = false
    
    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
//        print("touched \(digit) digit")
        
        if userIsinTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit;
        } else {
            display.text = digit
        }
        userIsinTheMiddleOfTyping = true
    }

    @IBAction func performOperation(sender: UIButton) {
        if let mathematicalSymbol = sender.currentTitle {
            userIsinTheMiddleOfTyping = false
            if mathematicalSymbol == "π" {
                display.text = String(M_PI)
            }
        }
    }
}


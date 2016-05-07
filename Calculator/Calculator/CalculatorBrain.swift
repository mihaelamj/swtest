//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Mihaela Mihaljevic Jakic on 07/05/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(sybmol: String) {
        switch  sybmol {
        case "π": accumulator = M_PI
        case "√": accumulator = sqrt(accumulator)
        default: break
        }
    }
    
    var result:Double {
        get {
           return accumulator
        }
    }
    
}
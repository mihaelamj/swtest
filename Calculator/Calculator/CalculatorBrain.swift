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
    
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.Constants,
        "e" : Operation.UnaryOperation,
        "√" : Operation.UnaryOperation,
        "cos" : Operation.UnaryOperation
    ]
    
    enum Operation {
        case Constants
        case UnaryOperation
        case BinaryOperation
        case Equals
    }
    
    func performOperation(sybmol: String) {
        if let operation = operations[sybmol] {
            switch operation {
            case .Constants: break
            case .UnaryOperation: break
            case .BinaryOperation: break
            case .Equals: break
            }
            
        }
    }
    
    var result:Double {
        get {
           return accumulator
        }
    }
    
}
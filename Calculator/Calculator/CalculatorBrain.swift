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
        "π"     : Operation.Constants(M_PI),
        "e"     : Operation.Constants(M_E),
        "√"     : Operation.UnaryOperation(sqrt),
        "cos"   : Operation.UnaryOperation(cos),
        "∆"     : Operation.UnaryOperation({ -$0 }),
        "×"     : Operation.BinaryOperation({ $0 * $1 }),
        "÷"     : Operation.BinaryOperation({ $0 / $1 }),
        "+"     : Operation.BinaryOperation({ $0 + $1 }),
        "−"     : Operation.BinaryOperation({ $0 - $1 }),
        "="     : Operation.Equals
    ]
    
    enum Operation {
        case Constants(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    struct PendingBinayOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    private var pending: PendingBinayOperationInfo?
    
    func performOperation(sybmol: String) {
        if let operation = operations[sybmol] {
            switch operation {
            case .Constants(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinayOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending =  nil
        }
        
    }
    
    var result:Double {
        get {
           return accumulator
        }
    }
    
}
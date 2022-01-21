//
//  Calculation.swift
//  Calculator
//
//  Created by Администратор  on 27.02.2020.
//  Copyright © 2020 Kirill Gavrilov. All rights reserved.
//

import Foundation

struct Calculation {
    
    var vc = ViewController()
    var currentOperation: Operation = .Null
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    
    func operation(operation: Operation) {
        if currentOperation != .Null {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                } else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                } else if currentOperation == .Multiple {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                } else if currentOperation == .Devide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                vc.outputLabel.text = result
            }
            currentOperation = operation
            
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
}

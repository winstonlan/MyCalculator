//
//  ViewController.swift
//  My Calculator
//
//  Created by Winston Lan on 4/4/17.
//  Copyright © 2017 winstonlan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet var display: UILabel!
    @IBOutlet var display: UILabel!
    var userIsTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
            let textCurrentDisplay = display.text!
            display.text = textCurrentDisplay + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
    }

    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        
        set {
           display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsTyping {
            brain.setOperand(displayValue)
            userIsTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
        
        
        
        
    }
    
    

}


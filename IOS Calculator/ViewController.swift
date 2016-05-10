//
//  ViewController.swift
//  IOS Calculator
//
//  Created by Gamal Shaban on 5/9/16.
//  Copyright © 2016 Gamal Shaban. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var answerField: UILabel!
    var lastNumber : String = ""
    var reset : Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    
    @IBAction func buttonTapped(theButton : UIButton) {
      
        if  answerField.text == "0" || reset {
          
            answerField.text = (theButton.titleLabel?.text)!
            reset = false

        }else{
         
           answerField.text = answerField.text! + (theButton.titleLabel?.text)!
        }
        
       
        
        
       
        
        
       print(theButton.titleLabel!.text!)
    }
    
    @IBAction func dotPutton(theButton : UIButton) {
        
        if !answerField.text!.containsString("."){
            answerField.text = answerField.text! + "."
        }
   
        
    }
    

    
    
    
    @IBAction func plusTapped(theButton : UIButton) {
       
        if operatorLabel.text == "" {
            operatorLabel.text = "+"
            lastNumber = answerField.text!
            reset = true
            
        }else{
            equalButton(nil)
            operatorLabel.text = "+"
            reset = false
        }
        
    }
    
    
    
    @IBAction func minusTapped(theButton : UIButton) {
       
        
        if operatorLabel.text == "" {
           operatorLabel.text = "-"
            lastNumber = answerField.text!
             reset = true
            
        }else{
            equalButton(nil)
            operatorLabel.text = "-"
        }
    }
    
    
    
    
    @IBAction func dividTapped(theButton : UIButton) {
        print("divid")
        if operatorLabel.text == "" {
            operatorLabel.text = "/"
            lastNumber = answerField.text!
            reset = true
            
        }else{
            equalButton(nil)
            operatorLabel.text = "/"
        }
    }
    
    
    
    
    @IBAction func multiplyTapped(theButton : UIButton) {
        print("multiply")
        if operatorLabel.text == "" {
            operatorLabel.text = "*"
            lastNumber = answerField.text!
             reset = true
            
        }else{
            equalButton(nil)
            operatorLabel.text = "*"
        }
    }
    
    
    
    
    @IBAction func  clearButton(_: AnyObject) {
       answerField.text = "0"
        operatorLabel.text = ""
        lastNumber = ""
    }

    
    @IBAction func  changeButton(_: AnyObject) {
        
        answerField.text = String(Double(answerField.text!)! * (-1.00))
    }
    
    
    
   
    
    @IBAction func  persentButton(_: AnyObject) {
        
        answerField.text = String(Double(answerField.text!)! / (100.00))
    }
    
  
    
    
    @IBAction func  equalButton(_: AnyObject?) {
        
        let num1 = Double(lastNumber)
        let num2 = Double(answerField.text!)
        
        if num1 == nil || num2 == nil {
            
            showError()
            return
            
        }
        var answer :Double = 0
        
        if operatorLabel.text == "-" {
            
            answer = num1! - num2!
            
        }else if operatorLabel.text == "+" {
            
            answer = num1! + num2!
            
        } else if operatorLabel.text == "*" {
            
            answer = num1! * num2!
            
        }else if operatorLabel.text == "/" {
            
            answer = num1! / num2!
            
 
        }else {
            
            showError()
            return
        }
 
      
        answerField.text = "\(answer)"
        operatorLabel.text = ""
        lastNumber = ""
        reset = true
    }

    
    
    func showError () {
        print("there was an error")
    }
    }




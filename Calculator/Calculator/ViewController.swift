//
//  ViewController.swift
//  Calculator
//
//  Created by Anish Gupta on 11/07/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var expsn: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var exp: String = ""
    
    func clrExpression() {
        exp = ""
        expsn.text = ""
    }
    
    func calculate() {
        var trimmed = exp.replacingOccurrences(of: "%", with: "*0.01")
        trimmed = trimmed.replacingOccurrences(of: "_", with: "*-1")
        let mathsExp = NSExpression(format: trimmed)
        let result = mathsExp.expressionValue(with: nil, context: nil) as! Double
        clrExpression()
        if(floor(result) == ceil(result)) {
            exp = String(format: "%.0f", result)
        }
        else {
            exp = String(format: "%.2f", result)
        }
        
        expsn.text = exp
            
    }

    @IBAction func clr(_ sender: Any) {
        clrExpression()
    }
    
    @IBAction func plysdivideminus(_ sender: Any) {
        exp += "_"
        calculate()
    }
    
    @IBAction func mod(_ sender: Any) {
        exp += "%"
        expsn.text = exp
    }
    
    @IBAction func divide(_ sender: Any) {
        exp += "/"
        expsn.text = exp
    }
    
    @IBAction func seven(_ sender: Any) {
        exp += "7"
        expsn.text = exp
    }
    
    @IBAction func eight(_ sender: Any) {
        exp += "8"
        expsn.text = exp
    }
    
    @IBAction func nine(_ sender: Any) {
        exp += "%"
        expsn.text = exp
    }
    
    @IBAction func multiply(_ sender: Any) {
        exp += "*"
        expsn.text = exp
    }
    
    @IBAction func four(_ sender: Any) {
        exp += "4"
        expsn.text = exp
    }
    
    @IBAction func five(_ sender: Any) {
        exp += "5"
        expsn.text = exp
    }
    
    @IBAction func six(_ sender: Any) {
        exp += "6"
        expsn.text = exp
    }
    
    @IBAction func minus(_ sender: Any) {
        exp += "-"
        expsn.text = exp
    }
    
    @IBAction func one(_ sender: Any) {
        exp += "1"
        expsn.text = exp
    }
    
    @IBAction func two(_ sender: Any) {
        exp += "2"
        expsn.text = exp
    }
    
    
    @IBAction func three(_ sender: Any) {
        exp += "3"
        expsn.text = exp
    }
    
    @IBAction func plus(_ sender: Any) {
        exp += "+"
        expsn.text = exp
    }
    
    
    @IBAction func zero(_ sender: Any) {
        exp += "0"
        expsn.text = exp
    }
    
    
    @IBAction func dot(_ sender: Any) {
        exp += "."
        expsn.text = exp
    }
    
    @IBAction func equal(_ sender: Any) {
        calculate()
    }
}


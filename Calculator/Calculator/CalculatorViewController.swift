//
//  ViewController.swift
//  Calculator
//
//  Created by Anish Gupta on 11/07/22.
//

import UIKit

protocol ViewControllerDelegate: NSObjectProtocol {
    func giveResult(result: String)
}

class ViewController: UIViewController {

    weak var delegate: ViewControllerDelegate?
    @IBOutlet weak var expression: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let lastResult = UserDefaults.standard.object(forKey: "lastResult") as? String {
            expression.text = lastResult
            currentExpression = lastResult
        }
        else {
            expression.text = "66"
            currentExpression = "66"
            UserDefaults.standard.set("66", forKey: "lastResult")
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    var currentExpression: String = ""
    
    func clearExpression() {
        currentExpression = ""
        expression.text = ""
    }
    
    func calculate() {
        var trimmed = currentExpression.replacingOccurrences(of: "%", with: "*0.01")
        trimmed = trimmed.replacingOccurrences(of: "_", with: "*-1")
        let mathsExpression = NSExpression(format: trimmed)
        let result = mathsExpression.expressionValue(with: nil, context: nil) as! Double
        clearExpression()
        if(floor(result) == ceil(result)) {
            currentExpression = String(format: "%.0f", result)
        }
        else {
            currentExpression = String(format: "%.2f", result)
        }
        
        expression.text = currentExpression
        UserDefaults.standard.set(currentExpression, forKey: "lastResult")
        if let delegate = delegate {
            delegate.giveResult(result: currentExpression)
        }
            
    }

    @IBAction func clear(_ sender: Any) {
        clearExpression()
    }
    
    
    @IBAction func changeSign(_ sender: Any) {
        currentExpression += "_"
        calculate()
    }
    
    @IBAction func button(_ sender: UIButton) {
        if let buttonPressed =  sender.titleLabel?.text {
            currentExpression += buttonPressed
            expression.text = currentExpression
        }
    }
    
    @IBAction func equalsTo(_ sender: Any) {
        calculate()
    }
    
}

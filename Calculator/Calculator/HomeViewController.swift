//
//  HomeViewController.swift
//  Calculator
//
//  Created by Anish Gupta on 14/07/22.
//

import UIKit


class CalculatorHome: UIViewController, ViewControllerDelegate {
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "HomeVCToCalculatorVC") {
            let displayVC = segue.destination as! ViewController
            displayVC.delegate = self
        }
    }
    
    func giveResult(result: String) {
        self.result.text = result
    }
}

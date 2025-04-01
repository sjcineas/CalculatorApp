//
//  ViewController.swift
//  Calculator
//
//  Created by Schadrack Cineas on 3/31/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calculatorOperations: UILabel!
    
    @IBOutlet weak var calculatorResults: UILabel!
    var workings = ""
    
    func clearAll(){
        workings = ""
        calculatorOperations.text = ""
        calculatorResults.text = ""
    }
    
    func addToOperations(_ value: String){
        workings += value
        calculatorOperations.text = workings
        calculatorResults.text = ""
    }
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    @IBAction func backspaceTap(_ sender: Any) {
        if !workings.isEmpty {
                workings.removeLast()
                calculatorOperations.text = workings
            }
    }
    @IBAction func moduloTap(_ sender: Any) {
        addToOperations("%")
    }
    @IBAction func divideTap(_ sender: Any) {
        addToOperations("/")

    }
    @IBAction func multiplyTap(_ sender: Any) {
        addToOperations("x")
    }
    @IBAction func minusTap(_ sender: Any) {
        addToOperations("-")
    }
    @IBAction func addTap(_ sender: Any) {
        addToOperations("+")

    }
    @IBAction func equalsTap(_ sender: Any) {
        let formattedWorkings = workings.replacingOccurrences(of: "x", with: "*")
                                            .replacingOccurrences(of: "%", with: "MOD")
        
        if formattedWorkings.contains("/0") {
                calculatorResults.text = "Error"
                return
            }


        let expression = NSExpression(format: formattedWorkings)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
                let resultString = formatResult(result: result)
                calculatorResults.text = resultString
            } else {
                calculatorResults.text = "Error"
            }
    }
    
    func formatResult (result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addToOperations(".")

    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToOperations("0")
    }
    @IBAction func oneTap(_ sender: Any) {
        addToOperations("1")
    }
    @IBAction func twoTap(_ sender: Any) {
        addToOperations("2")
    }
    @IBAction func threeTap(_ sender: Any) {
        addToOperations("3")
    }
    @IBAction func fourTap(_ sender: Any) {
        addToOperations("4")
    }
    @IBAction func fiveTap(_ sender: Any) {
        addToOperations("5")
    }
    @IBAction func sixTap(_ sender: Any) {
        addToOperations("6")
    }
    @IBAction func sevenTap(_ sender: Any) {
        addToOperations("7")
    }
    @IBAction func eightTap(_ sender: Any) {
        addToOperations("8")
    }
    @IBAction func nineTap(_ sender: Any) {
        addToOperations("9")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }


}


//
//  CalculatorSettings.swift
//  Calculator
//
//  Created by Zach Burt on 11/26/18.
//  Copyright © 2018 Zach Burt. All rights reserved.
//
//     Note of where comma's are placed in numbers.. 100  1,000  10,000  100,000  1,000,000  10,000,000  100,000,000  1,000,000,000

import UIKit

class CalculatorSettings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var result: UILabel!
    
    var storedResults = 0 // 1st part of equation is stored here
    var currentResults = 0 // 2nd part of equation is stored here
    var storedSign = 0 // equation sign (+/-/*/divide stored numerically here through their tags
    
    @IBAction func numbers(_ sender: UIButton) { //#'s 0-9
        
        if (result.text == "0") { //Checks if default value of 0 is displayed, if not then it will add the number instead of replacing
            result.text = String(sender.tag) //Changes UILabel named "result" to current sender.tag value of each number listed
        } else {
            result.text = result.text! + String(sender.tag)
        }
        
        currentResults = Int(result.text!)!
    }
    
    @IBAction func equationSigns(_ sender: UIButton) { // 10: =, 11: +, 12: -, 13: *, 14: /, 15: +/-, 16: AC
        
        if sender.tag == 16 { // AC - All Clear
            clearAllResults()
            storeResults()
        } else if sender.tag == 10 { // =
            currentResults = Int(result.text!)!
            print("Stored: \(storedResults) , Current: \(currentResults)")
            
            switch storedSign {
                case 11: // +
                result.text = String(storedResults + currentResults)
                case 12: // -
                    result.text = String(storedResults - currentResults)
                case 13: // *
                    result.text = String(storedResults * currentResults)
                case 14: // divide
                    result.text = String(storedResults / currentResults)
                default: // default, +
                    result.text = String(storedResults + currentResults)
                    print("default called")
            }
            
        } else if sender.tag == 11 || sender.tag == 12 || sender.tag == 13 || sender.tag == 14 { // Signs represented are +, -, *, /
            storeResults()
            result.text = "0"
            storedSign = sender.tag
        }
    }
    
    func storeResults() {
        if (result.text!.isInt) {
            storedResults = Int(result.text!)! //Stores results from previous calculations
            print("Stored results are.. \(storedResults)")
        } else {
            print("Can't store the results of a non-number")
        }
    }
    
    func clearAllResults() {
        result.text = "0"
        storedResults = 0
        currentResults = 0
        storedSign = 0
    }
}

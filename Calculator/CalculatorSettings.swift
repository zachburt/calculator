//
//  CalculatorSettings.swift
//  Calculator
//
//  Created by Zach Burt on 11/26/18.
//  Copyright © 2018 Zach Burt. All rights reserved.
//

import UIKit

class CalculatorSettings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var result: UILabel!
    
    var storedResults = 0;
    
    @IBAction func numbers(_ sender: UIButton) { //#'s 0-9
        
        if (result.text == "0") { //Checks if default value of 0 is displayed, if not then it will add the number instead of replacing
            result.text = String(sender.tag) //Changes UILabel named "result" to current sender.tag value of each number listed
        } else {
            result.text = result.text! + String(sender.tag)
        }
        storeResults()
        
    }
    
    @IBAction func equationSigns(_ sender: UIButton) { // 10: =, 11: +, 12: -, 13: *, 14: /, 15: +/-, 16: AC
        switch sender.tag {
            case 10...15:
                storeResults()
                result.text = sender.titleLabel!.text
            case 16:
                result.text = "0"
                storedResults = 0;
                storeResults()
            default:
                print("required by law")
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
}

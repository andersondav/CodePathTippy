//
//  ViewController.swift
//  CodePathTippy
//
//  Created by Anderson David on 1/14/20.
//  Copyright © 2020 Anderson David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalBill: UILabel!
    @IBOutlet weak var tipPercents: UISegmentedControl!
    @IBOutlet weak var billAmount: UITextField!
    
    var percentages = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupPercentages()
        
    }
    
    func setupPercentages() {
        if let percentages = UserDefaults.standard.array(forKey: "percentages") as? [Int] {
            self.percentages = percentages
        }
        else {
            self.percentages = [15, 20, 25]
        }
        
        tipPercents.setTitle("\(self.percentages[0])%", forSegmentAt: 0)
        tipPercents.setTitle("\(self.percentages[1])%", forSegmentAt: 1)
        tipPercents.setTitle("\(self.percentages[2])%", forSegmentAt: 2)
    }


    @IBAction func clearKeyboard(_ sender: Any) {
        view.endEditing(true)
        print("exited!")
    }
    
    @IBAction func percentChange(_ sender: Any) {
        
        if let bill = Double(billAmount.text!) {
            let index = tipPercents.selectedSegmentIndex
            var tip = Double(self.percentages[index]) / 100.0 * bill
            tipAmount.text = String.init(format: "$%.2f", tip)
            totalBill.text = String.init(format: "$%.2f", tip + bill)

        }
        else {
            tipAmount.text = "__"
            totalBill.text = "__"
        }
        
    }
    
    
    
    
}


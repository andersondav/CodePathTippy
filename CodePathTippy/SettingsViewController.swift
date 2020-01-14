//
//  SettingsViewController.swift
//  CodePathTippy
//
//  Created by Anderson David on 1/14/20.
//  Copyright © 2020 Anderson David. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var percentone: UITextField!
    @IBOutlet weak var percentTwo: UITextField!
    @IBOutlet weak var percentThree: UITextField!
    
    @IBOutlet weak var saveOne: UIButton!
    @IBOutlet weak var saveTwo: UIButton!
    @IBOutlet weak var saveThree: UIButton!
    
    var percentages = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupFields()
    }
    
    func setupFields() {
        percentone.text = "\(self.percentages[0])"
        percentTwo.text = "\(self.percentages[1])"
        percentThree.text = "\(self.percentages[2])"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func exitKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func saveOne(_ sender: Any) {
        if let percent = Int(percentone.text!) {
            self.percentages[0] = percent
            savePercentages()
        }
    }
    
    @IBAction func saveTwo(_ sender: Any) {
        
        if let percent = Int(percentTwo.text!) {
            self.percentages[1] = percent
            savePercentages()
        }
        
    }
    
    @IBAction func saveThree(_ sender: Any) {
        
        if let percent = Int(percentThree.text!) {
            self.percentages[2] = percent
            savePercentages()
        }
        
    }
    
    func savePercentages() {
        UserDefaults.standard.set(self.percentages, forKey: "percentages")
    }
    
    @IBAction func editOne(_ sender: Any) {
        if let percent = Int(percentone.text!) {
            if percent > 0 {
                saveOne.isEnabled = true
            }
            else {
                saveOne.isEnabled = false
            }
        }
        else {
            saveOne.isEnabled = false
        }
    }
    
    @IBAction func editTwo(_ sender: Any) {
        if let percent = Int(percentTwo.text!) {
            if percent > 0 {
                saveTwo.isEnabled = true
            }
            else {
                saveTwo.isEnabled = false
            }
        }
        else {
            saveTwo.isEnabled = false
        }
    }
    
    @IBAction func editThree(_ sender: Any) {
        if let percent = Int(percentThree.text!) {
            if percent > 0 {
                saveThree.isEnabled = true
            }
            else {
                saveThree.isEnabled = false
            }
        }
        else {
            saveThree.isEnabled = false
        }
    }
    
}

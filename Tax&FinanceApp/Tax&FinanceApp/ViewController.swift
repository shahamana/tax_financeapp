//
//  ViewController.swift
//  Tax&FinanceApp
//
//  Created by Aman Shah on 3/23/19.
//  Copyright © 2019 LAHacks2019. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents (in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    let Options = ["Single", "Head Of Household", "Married Filing Jointly/Qualifying Widow", "Married Filing Separately"]
    
    @IBOutlet weak var Items: UIPickerView!
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Options.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Options[row]
    }
    @IBOutlet weak var yearlyIncome: UITextField!
    @IBOutlet weak var taxAmount: UILabel!
    var a:Double?
    @IBAction func incomeIdentfier(_ sender: AnyObject) {
        var text:String = sender.text ?? "";
        let num = Double(text)
        func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if row == 0 {
                a = Calc.taxRateCalc(status: "Single", income: num!)
            }
            if row == 1 {
                a = Calc.taxRateCalc(status: "Head of Household", income: num!)
            }
            if row == 2 {
                a = Calc.taxRateCalc(status: "Married Filing Jointly/Qualifyng Widow", income: num!)
            }
            if row == 3 {
                a = Calc.taxRateCalc(status: "Married Filing Separately", income: num!)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Items.dataSource = self
        Items.delegate = self
        yearlyIncome.delegate = self
        yearlyIncome.addTarget(self, action: #selector(incomeIdentfier(_:)), for: .editingChanged)
    }
    
   
    }
    var taxStatus: String = ""
    
    class Calc{
        
        var taxStatus: String
        var userYearlyIncome: Int
        
        init() {
            self.taxStatus = ""
            self.userYearlyIncome = 0
        }
        
        
        
        static func taxRateCalc(status: String, income: Double)-> Double {
            if status == "Single" {
                if income <= 9700 {
                    return 0.10
                }
                if income >= 9701 && income <= 39475 {
                    return 0.12
                }
                if income >= 39476 && income <= 84200 {
                    return 0.22
                }
                if income >= 84201 && income <= 160725 {
                    return 0.24
                }
                if income >= 160726 && income <= 204100 {
                    return 0.32
                }
                if income >= 204101 && income <= 510300 {
                    return 0.35
                }
                if income >= 510301 {
                    return 0.37
                }
            }
            if status == "Head of Household" {
                if income <= 13850 {
                    return 0.10
                }
                if income >= 13851 && income <= 52850 {
                    return 0.12
                }
                if income >= 52851 && income <= 84200 {
                    return 0.22
                }
                if income >= 84201 && income <= 160700 {
                    return 0.24
                }
                if income >= 160701 && income <= 204100 {
                    return 0.32
                }
                if income >= 204101 && income <= 510300 {
                    return 0.35
                }
                if income >= 510301 {
                    return 0.37
                }
            }
            if status == "Married Filing Separately" {
                if income <= 9700 {
                    return 10
                }
                if income >= 9701 && income <= 39475 {
                    return 0.12
                }
                if income >= 39476 && income <= 84200 {
                    return 0.22
                }
                if income >= 84201 && income <= 160725 {
                    return 0.24
                }
                if income >= 160726 && income <= 204100 {
                    return 0.32
                }
                if income >= 204101 && income <= 306175 {
                    return 0.35
                }
                if income >= 306176 {
                    return 0.37
                }
            }
            if status == "Married Filing Jointly/Qualifying Widow" {
                if income <= 19400 {
                    return 0.10
                }
                if income >= 19401 && income <= 78950 {
                    return 0.12
                }
                if income >= 78951 && income <= 168400 {
                    return 0.22
                }
                if income >= 168401 && income <= 321450 {
                    return 0.24
                }
                if income >= 321451 && income <= 408200 {
                    return 0.32
                }
                if income >= 408201 && income <= 612350 {
                    return 0.35
                }
                if income >= 612351 {
                    return 0.37
                }
            }
            return 0.00
        }
        
        
        
    }
    
    
    
    



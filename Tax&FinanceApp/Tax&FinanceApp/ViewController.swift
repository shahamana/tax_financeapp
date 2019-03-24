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
    @IBAction func incomeIdentfier(_ sender: UITextField) {
        updateText()
    }
    
    func updateText(){
        print("update text")
        var text = yearlyIncome.text ?? ""
        let num = Double(text)
        var incomeTax:Double?
        incomeTax = Calc.taxRateCalc(status: maritalStatus(), income: num ?? 0)
        let stringTax: String = "\(String(describing: incomeTax))"
       taxAmount.text = stringTax
    }
    func maritalStatus() -> String{
        var row:Int = Items.selectedRow(inComponent: 0)
        print(row)
        print(Options[row])
        return Options[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow: Int, inComponent: Int) {
        //taxAmount.text = stringTax
        updateText()
    }
    //incomeIdentifier(_sender: UITextField)
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
                else if income >= 9701 && income <= 39475 {
                    return 0.12
                }
                else if income >= 39476 && income <= 84200 {
                    return 0.22
                }
                else if income >= 84201 && income <= 160725 {
                    return 0.24
                }
                else if income >= 160726 && income <= 204100 {
                    return 0.32
                }
                else if income >= 204101 && income <= 510300 {
                    return 0.35
                }
                else if income >= 510301 {
                    return 0.37
                }
            }
            if status == "Head of Household" {
                if income <= 13850 {
                    return 0.10
                }
                else if income >= 13851 && income <= 52850 {
                    return 0.12
                }
                else if income >= 52851 && income <= 84200 {
                    return 0.22
                }
                else if income >= 84201 && income <= 160700 {
                    return 0.24
                }
                else if income >= 160701 && income <= 204100 {
                    return 0.32
                }
                else if income >= 204101 && income <= 510300 {
                    return 0.35
                }
                else if income >= 510301 {
                    return 0.37
                }
            }
            if status == "Married Filing Separately" {
                if income <= 9700 {
                    return 0.10
                }
                else if income >= 9701 && income <= 39475 {
                    return 0.12
                }
                else if income >= 39476 && income <= 84200 {
                    return 0.22
                }
                else if income >= 84201 && income <= 160725 {
                    return 0.24
                }
                else if income >= 160726 && income <= 204100 {
                    return 0.32
                }
                else if income >= 204101 && income <= 306175 {
                    return 0.35
                }
                else if income >= 306176 {
                    return 0.37
                }
            }
            if status == "Married Filing Jointly/Qualifying Widow" {
                if income <= 19400 {
                    return 0.10
                }
                else if income >= 19401 && income <= 78950 {
                    return 0.12
                }
                else if income >= 78951 && income <= 168400 {
                    return 0.22
                }
                else if income >= 168401 && income <= 321450 {
                    return 0.24
                }
                else if income >= 321451 && income <= 408200 {
                    return 0.32
                }
                else if income >= 408201 && income <= 612350 {
                    return 0.35
                }
                else if income >= 612351 {
                    return 0.37
                }
            }
            return 0.00
        }
        
        
        
    }
    
    
    
    



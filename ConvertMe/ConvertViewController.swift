//
//  ConvertViewController.swift
//  ConvertMe
//
//  Created by Kenneth Jones on 3/6/21.
//

import UIKit

class ConvertViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var convertedLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var currency: Currency = .cad
    let currencyStrings = ["CAD🇨🇦", "GBP🇬🇧", "USD🇺🇸"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.isHidden = true
        currencyPicker.isHidden = true
        
        usdTextField.keyboardType = .decimalPad
    }
    
    func updateViews() {
        convertedLabel.text = currency.convert(amountString: usdTextField.text ?? "0")
    }
    
    @IBAction func selectCurrency(_ sender: Any) {
        usdTextField.resignFirstResponder()
        currencyPicker.isHidden = false
        doneButton.isHidden = false
    }
    
    @IBAction func finishSelectingCurrency(_ sender: Any) {
        doneButton.isHidden = true
        currencyPicker.isHidden = true
    }
    
    @IBAction func updateValue(_ sender: Any) {
        updateViews()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Currency.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currencyStrings[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Keeping this switch statement here to use as an example of what not to do if possible especially with lots of values
//        switch row {
//        case 0:
//            currency = .cad
//        case 1:
//            currency = .gbp
//        default:
//            currency = .cad
//        }
        
        currency = Currency.allCases[row]
        convertButton.setTitle(currencyStrings[row], for: .normal)
        updateViews()
    }

}

//
//  ConvertViewController.swift
//  ConvertMe
//
//  Created by Kenneth Jones on 3/6/21.
//

import UIKit

class ConvertViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var rightTextField: UITextField!
    @IBOutlet weak var rightConvertButton: UIButton!
    @IBOutlet weak var leftConvertButton: UIButton!
    @IBOutlet weak var rightDoneButton: UIButton!
    @IBOutlet weak var leftDoneButton: UIButton!
    @IBOutlet weak var rightCurrencyPicker: UIPickerView!
    @IBOutlet weak var leftCurrencyPicker: UIPickerView!
    
    var rightCurrency: Currency = .cad
    let rightCurrencyStrings = ["CAD🇨🇦", "GBP🇬🇧", "USD🇺🇸"]
    
    var leftCurrency: Currency = .usd
    let leftCurrencyStrings = ["🇨🇦CAD", "🇬🇧GBP", "🇺🇸USD"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightDoneButton.isHidden = true
        rightCurrencyPicker.isHidden = true
        
        leftDoneButton.isHidden = true
        leftCurrencyPicker.isHidden = true
        
        leftTextField.keyboardType = .decimalPad
        rightTextField.keyboardType = .decimalPad
    }
    
    func updateRightTextField() {
        rightTextField.text = rightCurrency.convert(amountString: leftTextField.text ?? "", from: leftCurrency)
    }
    
    func updateLeftTextField() {
        leftTextField.text = leftCurrency.convert(amountString: rightTextField.text ?? "", from: rightCurrency)
    }
    
    @IBAction func selectRightCurrency(_ sender: Any) {
        leftTextField.resignFirstResponder()
        rightTextField.resignFirstResponder()
        rightCurrencyPicker.isHidden = false
        rightDoneButton.isHidden = false
    }
    
    @IBAction func selectLeftCurrency(_ sender: Any) {
        rightTextField.resignFirstResponder()
        leftTextField.resignFirstResponder()
        leftCurrencyPicker.isHidden = false
        leftDoneButton.isHidden = false
    }
    
    @IBAction func finishSelectingRightCurrency(_ sender: Any) {
        rightDoneButton.isHidden = true
        rightCurrencyPicker.isHidden = true
    }
    
    @IBAction func finishSelectingLeftCurrency(_ sender: Any) {
        leftDoneButton.isHidden = true
        leftCurrencyPicker.isHidden = true
    }
    
    @IBAction func updateLeftValue(_ sender: Any) {
        updateRightTextField()
    }
    
    @IBAction func updateRightValue(_ sender: Any) {
        updateLeftTextField()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Currency.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == rightCurrencyPicker {
            return rightCurrencyStrings[row]
        } else {
            return leftCurrencyStrings[row]
        }
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
        
        if pickerView == rightCurrencyPicker {
            rightCurrency = Currency.allCases[row]
            rightConvertButton.setTitle(rightCurrencyStrings[row], for: .normal)
            updateRightTextField()
        } else {
            leftCurrency = Currency.allCases[row]
            leftConvertButton.setTitle(leftCurrencyStrings[row], for: .normal)
            updateLeftTextField()
        }
    }

}

//
//  Currency.swift
//  ConvertMe
//
//  Created by Kenneth Jones on 3/6/21.
//

import Foundation

enum Currency: Double, CaseIterable {
    case cad = 1.27
    case gbp = 0.72
    case usd = 1
    
    private func convert(_ amount: Double, from currency: Currency) -> Double {
        (amount / currency.rawValue) * self.rawValue
    }
    
    func convert(amountString: String, from currency: Currency) -> String? {
        guard let amount = Double(amountString) else {
            return ""
        }
        
        return String(format: "%.2f", convert(amount, from: currency))
    }
}

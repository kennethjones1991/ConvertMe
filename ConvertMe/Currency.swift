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
    
    private func convert(_ dollars: Double) -> Double {
        dollars * self.rawValue
    }
    
    func convert(amountString: String) -> String? {
        guard let amount = Double(amountString) else {
            return "0.00"
        }
        
        return String(format: "%.2f", convert(amount))
    }
}

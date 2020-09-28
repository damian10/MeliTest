//
//  Double+Extensions.swift
//  MeliTest
//
//  Created by Damian Pintos on 9/26/20.
//

import Foundation

extension Double {
    func formattedAmount() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

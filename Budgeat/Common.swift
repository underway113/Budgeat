//
//  Common.swift
//  Budgeat
//
//  Created by Jeremy Adam on 29/04/19.
//  Copyright © 2019 William Inx. All rights reserved.
//

import Foundation


//Formatting Number Integer to String - IDR xx.xxx.xxx
func formatNumber(_ number:Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 0
    formatter.locale = Locale.init(identifier: "id-ID")
    formatter.currencyCode = "Rp "
    
    return formatter.string(for: number) ?? "Invalid Value"
}


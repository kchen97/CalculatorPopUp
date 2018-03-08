//
//  Calculator.swift
//  CalculatorPopUp
//
//  Created by Korman Chen on 3/2/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import Foundation

class CalculatorModel{

    var value: Double?
    
    func addTax(_ tax: Double) -> String {return "\(value! + value! * tax)"}
}

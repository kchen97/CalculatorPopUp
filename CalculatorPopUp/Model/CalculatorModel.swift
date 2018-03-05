//
//  Calculator.swift
//  CalculatorPopUp
//
//  Created by Korman Chen on 3/2/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CalculatorModel{
    
    let endpoint = "https://api.taxjar.com/v2/rates/:zip"
    var value: Double?
    
    func addTax(_ zip: String) -> String {
        
        let headers = ["Authorization: Token token=" : "772e9b5b4246d9fc65ff4f0362c11916"]
        let params = ["country" : "CA", "zip" : zip]
        
        Alamofire.request(endpoint, method: .get, parameters: params, headers: headers).responseJSON { (response) in
            print(response)
        }
        
//        Alamofire.request(endpoint + zip, method: .get).responseJSON { (response) in
//            print(response.value)
//        }
        
        return ""
    }
}

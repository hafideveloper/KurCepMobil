//
//  CurrencyResponse.swift
//  KurCepMobil
//
//  Created by Apple on 3.09.2024.
//

import Foundation
import UIKit

struct Response:Codable {
    var success:Bool
    var base:String
    var rates : [String:Double]
}

struct CurrencyResponse {
    var currencyName:String
    var value:Double
}

var currencyResponseList = [CurrencyResponse(currencyName: "Test", value: 2.0)]

//
//  CurrencyModel.swift
//  KurCepMobil
//
//  Created by Apple on 28.08.2024.
//

import Foundation
import UIKit

struct Currency {
    var changeRate:Double
    var price:Double
    var currencyIcon:UIImage
    var currencyName:String
}

var currencyList = [
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "usd")!, currencyName: "USD"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "euro")!, currencyName: "EUR"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY")
]

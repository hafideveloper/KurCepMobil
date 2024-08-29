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
    Currency(changeRate: 0.06, price: 34.0, currencyIcon: UIImage(named: "usd")!, currencyName: "USD"),
    Currency(changeRate: 0.71, price: 37.0, currencyIcon: UIImage(named: "euro")!, currencyName: "EUR"),
    Currency(changeRate: 0.19, price: 40.0, currencyIcon: UIImage(named: "chf")!, currencyName: "CHF"),
    Currency(changeRate: 1.29, price: 0.23, currencyIcon: UIImage(named: "jpy")!, currencyName: "JPY"),
    Currency(changeRate: 0.46, price: 0.36, currencyIcon: UIImage(named: "rub")!, currencyName: "RUB"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY"),
    Currency(changeRate: 1.0, price: 34.0, currencyIcon: UIImage(named: "try")!, currencyName: "TRY")
]

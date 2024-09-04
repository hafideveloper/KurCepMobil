import Foundation
import UIKit

struct Response: Codable {
    var success: Bool
    var base: String
    var rates: [String: Double]
}


struct CurrencyResponse {
    var currencyName: String
    var value: Double
    var changeRate: Double
}

var currencyResponseList = [CurrencyResponse(currencyName: "Test", value: 2.0, changeRate: 0.12)]


//
//  Currency.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 17/06/2024.
//

import Foundation

struct Currency:Hashable,Codable{
    var name:String
    var unit:String
    var value:Double
    var type:String
    var flag:String
}

struct CoinGeckoResponse: Codable {
    var rates: [String: Currency]
}

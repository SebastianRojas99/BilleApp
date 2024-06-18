//
//  Card.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 18/06/2024.
//

import Foundation

struct Card:Hashable,Codable,Identifiable{
    
    var id:UUID = .init()
    var name:String
    var number:String
    var date:Date
    var cvv: Int
    var credit: Float
}

//
//  Card.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 18/06/2024.
//

import Foundation

struct Card: Hashable, Codable, Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var typeCard:String
    var number: String
    var expiryDate: String 
    var cvv: String
    var credit: Double
}


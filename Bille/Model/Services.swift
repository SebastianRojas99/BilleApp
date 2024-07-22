//
//  Services.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 22/06/2024.
//

import Foundation

struct Services:Hashable,Codable{
    var name: String
    var provider: User
    var description: String
    var price: Double
    
}

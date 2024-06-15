//
//  User.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 14/06/2024.
//

import Foundation

struct User:Hashable,Codable,Identifiable{
    var id: UUID = .init()
    var name:String
    var lastname:String
    var email:String
    var address:String
    var birthday:Date
    var password:String
    
    var state:Int
}

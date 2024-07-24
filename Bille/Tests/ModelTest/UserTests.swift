//
//  User.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 14/06/2024.
//

import Foundation

struct UserTests:Hashable,Codable,Identifiable{
    var id: UUID = .init()
    var image: String
    var name:String
    var lastname:String
    var username:String
    var email:String
    var address:String
    var birthday:Date
    var password:String
    var accountAmount:Int
    var cards:[CardTest]
    var services:[ServicesTests]
    
    var role:role
    var state:state
}


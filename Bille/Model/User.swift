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
    var username:String
    var email:String
    var address:String
    var birthday:Date
    var password:String
    var cards:[Card]
    
    var role:Role
    var state:UserState
}

enum UserState: Int, Codable {
    case active = 1
    case inactive = 2
    case banned = 3
}

enum Role: Int, Codable {
    case user = 1
    case admin = 2
    case customer = 3
}

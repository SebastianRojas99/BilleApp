//
//  DatabaseHardcoded.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 18/06/2024.
//

import Foundation


var users: [User] = [
    
    User(name: "Seba",
         lastname: "Rojas",
         username: "seba", email: "sebarojas@example.com",
         address: "AV gatorade 123",
         birthday: DateFormatter().date(from: "01/15/2001") ?? Date(),
         password: "123",
         accountAmount: 300, cards: [
            Card(name: "S MARQUEZ ROJAS".lowercased(), typeCard: "MasterCard", number: "2550 3030 9494 1112", expiryDate: "11/28", cvv: "333", credit: 1000000),
            Card(name: "S MARQUEZ ROJAS".lowercased(), typeCard: "Visa", number: "4550 3031 9494 1112", expiryDate: "11/30", cvv: "222", credit: 1000000),
         ],
         services: [], role: Role.admin, state: UserState.active
        ),
    User(name: "apple",
         lastname: "man",
         username: "apple-man", email: "apple-man@example.com",
         address: "AV manzana 999",
         birthday: DateFormatter().date(from: "01/15/1995") ?? Date(),
         password: "123",
         accountAmount: 10000, cards: [
            Card(name: "APPLE-MAN".lowercased(), typeCard: "MasterCard", number: "2550 3030 9494 3232", expiryDate: "11/28", cvv: "333", credit: 1000000),
            Card(name: "APPLE-MAN".lowercased(), typeCard: "Visa", number: "4550 3031 9494 5723", expiryDate: "11/30", cvv: "222", credit: 1000000),
         ],
         services: [], role: Role.admin, state: UserState.active
        ),
    User(name: "Candela",
         lastname: "S",
         username: "cande", email: "cande@example.com",
         address: "AV bb 290",
         birthday: DateFormatter().date(from: "01/15/2001") ?? Date(),
         password: "123",
         accountAmount: 500, cards: [
            Card(name: "CANDELA S".lowercased(), typeCard: "MasterCard", number: "4411 6585 2234 1238", expiryDate: "11/28", cvv: "333", credit: 1000000),
            Card(name: "CANDELA S".lowercased(), typeCard: "Visa", number: "2221 4367 9494 9984", expiryDate: "11/30", cvv: "222", credit: 1000000),
         ],
         services: [], role: Role.user, state: UserState.active
        ),
    
]

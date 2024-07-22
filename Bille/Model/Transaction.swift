//
//  Transaction.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 22/07/2024.
//

import Foundation

struct Transaction:Codable,Hashable,Identifiable{
    var id: UUID = .init()
    var amount:Int
    var date:Date
}

//
//  UserEnum.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 24/07/2024.
//

import Foundation

enum state: Int16, Codable {
    case active = 1
    case inactive = 2
    case banned = 3
}

enum role: Int16, Codable {
    case user = 1
    case admin = 2
    case customer = 3
}


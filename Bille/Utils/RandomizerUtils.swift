//
//  RandomizerUtils.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 31/07/2024.
//

import Foundation

extension String{
    func randomizer()->String{
        let random = Int.random(in: 100...999)
        return String(random)
    }
    func randomCardNumber()->String{
        let random = Int.random(in: 1000...9999)
        return String(random)
    }
    func cardNum()->String{
        let number = randomCardNumber() + " " + randomCardNumber() + " " + randomCardNumber() + " " + randomCardNumber()
        return number
    }
}

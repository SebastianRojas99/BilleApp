//
//  CardVM.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 20/06/2024.
//

import Foundation
import Observation

@Observable
class CardVM{
    
    var users:[User] = []
    
    func addCard(to user: User, card: Card) {
        if let index = users.firstIndex(where: { $0.username == user.username }) {
                users[index].cards.append(card)
            }
        }
}

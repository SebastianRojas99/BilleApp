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
    
    
    
    func addCard(card:Card){
        
        _ = Card(name: card.name, typeCard: card.typeCard, number: card.number, expiryDate: card.expiryDate, cvv: card.cvv, credit: card.credit)
        
                                
    }
}

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
    
   var userVM:UserVM
    
    init(userVM: UserVM) {
        self.userVM = userVM
    }
    
    func addCardToUser(card: Card, email: String) {
        if let index = userVM.userList.firstIndex(where: { $0.username == email || $0.email == email }) {
            userVM.userList[index].cards.append(card)
        } else {
            print("Error: Usuario no encontrado")
        }
    }
}

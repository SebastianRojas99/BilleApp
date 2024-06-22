//
//  UserVM.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 15/06/2024.
//

import Foundation
import SwiftUI
import Observation

@Observable
class UserVM{
    
    var username:String?
    var userList: [User] = []
    var userCards:[Card] = []
    

    
    func validation(_ email: String, _ password: String) -> Bool {
        // Buscar usuario en la lista de usuarios
        if users.first(where: { ($0.email == email || $0.username == email) && $0.password == password }) != nil {     
            
            username = email            
            getCards(email)
            return true
        }
        // Usuario no encontrado o contraseña no coincide
        return false
    }
    func register(){
        
    }
    func getCards(_ email:String){
       if let users =  users.first(where: {($0.username == email || $0.email == email)}){
           userCards = users.cards
       }else{
           print("error de tarjetas")
       }
           
    }
    
    func getUser() -> String?{
            return username
        }
}


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
class UserVMT{
    var image:String = ""
    var name:String = ""
    var lastname:String = ""
    var address:String = ""
    var birthday:Date = DateFormatter().date(from: "01/15/2021") ?? Date()
    var username:String?
    var amount:Int?
    var sendMoneyTest:Int = 0
    var userList: [UserTests] = []
    var userCards:[CardTest] = []
    
    
    
    func getCards(_ email: String) {
        if let user = users.first(where: { $0.username == email || $0.email == email }) {
            userCards = user.cards
        } else {
            print("Error de tarjetas")
        }
    }
    
    func addCard(_ card:CardTest,_ username:String){
        if users.first(where: {($0.username == username || $0.email == username)}) != nil{
            userCards.append(card)
        }else{
            print("error de tarjetas")
        }
    }
    
    func deleteCard(_ card: CardTest, _ username: String) {
        // Verificar si el usuario existe
        if users.first(where: { $0.username == username || $0.email == username }) != nil {
            // Encontrar el índice de la tarjeta en el array
            if let index = userCards.firstIndex(where: { $0.id == card.id }) {
                // Eliminar la tarjeta en la posición encontrada
                userCards.remove(at: index)
                print("Tarjeta eliminada correctamente")
            } else {
                print("Error: Tarjeta no encontrada")
            }
        } else {
            print("Error: Usuario no encontrado")
        }
    }
    
    func validation(_ email: String, _ password: String) -> Bool {
        // Buscar usuario en la lista de usuarios
        if let user = users.first(where: { ($0.email == email || $0.username == email) && $0.password == password }) {
            // Usuario encontrado y contraseña coincide
            image = user.image
            username = user.username
            name = user.name  // Asignar el nombre del usuario encontrado
            lastname = user.lastname
            address = user.address
            birthday = user.birthday
            getCards(email)   // Asumimos que este método obtiene las tarjetas del usuario
            getAmount(email)  // Asumimos que este método obtiene el monto del usuario
            return true
        }
        // Usuario no encontrado o contraseña no coincide
        return false
    }
    func logout(){
        image = ""
        username = ""
        name = ""
        lastname = ""
        address = ""
        birthday = Date()
        amount = 0
        userCards = []
        
    }

    func register(){
        
    }
        
    func getAmount(_ email:String){
       if let users =  users.first(where: {($0.username == email || $0.email == email)}){
           amount = users.accountAmount
       }else{
           print("error de monto")
       }
           
    }
    
    func send(_ email:String, money:Int){
        if var users =  users.first(where: {($0.username == email || $0.email == email)}){
            sendMoneyTest = money
            if sendMoneyTest<=amount!{
                amount! -= sendMoneyTest
            }else{
                print("dinero insuficiente")
            }            
            users.accountAmount += sendMoneyTest
        }else{
            print("error de monto")
        }
    }
    
    func getUser() -> String?{
            return username
        }
    
}


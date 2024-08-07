//
//  CardVM.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 25/07/2024.
//

import Foundation
import CoreData
import Observation
import SwiftUI

@Observable
class CardVM{
    var id = UUID()
    var name:String = ""
    var number:String = ""
    var type:String = ""
    var expiryDate:String = ""
    var cvv:String = ""
    var card:Card?
    var user:User?
    var sendMessage:String = ""
    
    
    

    
    func add(context:NSManagedObjectContext,loggedUser:UUID){
        let newCard = Card(context:context)
        
        newCard.id = id
        newCard.name = name
        newCard.number = number
        newCard.type = type
        newCard.expiryDate = expiryDate
        newCard.cvv = cvv
        newCard.userId = loggedUser
        
        do{
            try context.save()
            print("tarjeta guardada")
        }catch{
            print("error al crear una tarjeta")
        }
    }
    
    func createCardForUser(context:NSManagedObjectContext,userId:UUID,nameAndLast:String){
        let userCard = Card(context: context)
        
        userCard.id = id
        userCard.name = nameAndLast
        userCard.number = number.cardNum()
        userCard.type = "BILLE CARD"
        userCard.expiryDate = "12/30"
        userCard.cvv = cvv.randomizer()        
        userCard.userId = userId
        
        do{
            try context.save()
            print("tarjeta usuario \(nameAndLast) creada")
        }catch{
            print("error en ",error.localizedDescription)
        }
        
    }
    
    func getCardsForUser(context: NSManagedObjectContext, userId: UUID) -> [Card] {
        let fetchRequest: NSFetchRequest<Card> = Card.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userId == %@", userId as CVarArg)
        
        do {
            let cards = try context.fetch(fetchRequest)
            return cards
        } catch {
            print("Error al obtener las tarjetas: \(error.localizedDescription)")
            return []
        }
    }
    
    func update(){
        
    }
    
    func delete(){
        
    }

    
}

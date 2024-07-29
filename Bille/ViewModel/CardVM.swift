//
//  CardVM.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 25/07/2024.
//

import Foundation
import CoreData
import Observation

@Observable
class CardVM{
    var id = UUID()
    var name:String = ""
    var number:String = ""
    var type:String = ""
    var expiryDate:String = ""
    var cvv:String = ""
    var credit:Double = 15000.0
    
    
    func add(context:NSManagedObjectContext,loggedUser:UUID){
        let newCard = Card(context:context)
        
        newCard.id = id
        newCard.name = name
        newCard.number = number
        newCard.type = type
        newCard.expiryDate = expiryDate
        newCard.cvv = cvv
        newCard.credit = credit
        newCard.userId = loggedUser
        
        do{
            try context.save()
            print("tarjeta guardada")
        }catch{
            print("error al crear una tarjeta")
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
}

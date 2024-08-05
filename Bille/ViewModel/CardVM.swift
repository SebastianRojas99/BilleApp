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
    var credit:Decimal = 15000.00
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
        newCard.credit = (credit) as NSDecimalNumber
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
        userCard.credit = 20000
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
    
    
//    func send(to receiverUsername: String, amount: Decimal, context: NSManagedObjectContext) {
//        guard let card = card, let senderAccountAmount = card.credit as Decimal? else {
//            sendMessage = "Sender is not logged in or sender account amount is not available"
//            return
//        }
//
//        if senderAccountAmount < amount {
//            sendMessage = "Insufficient funds"
//            return
//        }
//
//        // Fetch the receiver's user entity using the username
//        let userFetchRequest: NSFetchRequest<User> = User.fetchRequest()
//        userFetchRequest.predicate = NSPredicate(format: "username == %@", receiverUsername)
//
//        do {
//            let users = try context.fetch(userFetchRequest)
//            if users.isEmpty {
//                sendMessage = "Receiver not found"
//                return
//            }
//
//            guard let receiver = users.first else {
//                sendMessage = "Failed to get receiver"
//                return
//            }
//
//            // Fetch the receiver's BILLE CARD
//            let cardFetchRequest: NSFetchRequest<Card> = Card.fetchRequest()
//            cardFetchRequest.predicate = NSPredicate(format: "userId == %@ AND type == %@", receiver.id! as CVarArg, "BILLE CARD")
//
//            let cards = try context.fetch(cardFetchRequest)
//            if cards.isEmpty {
//                sendMessage = "Receiver's BILLE CARD not found"
//                return
//            }
//
//            guard let receiverCard = cards.first else {
//                sendMessage = "Failed to get receiver's BILLE CARD"
//                return
//            }
//
//            // Perform the transaction
//            card.credit = (senderAccountAmount - amount) as NSDecimalNumber
//            receiverCard.credit = ((receiverCard.credit as Decimal? ?? 0) + amount) as NSDecimalNumber
//
//            sendMessage = "Transaction successful"
//
//            try context.save()
//        } catch {
//            print("Failed to send money: \(error.localizedDescription)")
//            sendMessage = "Failed to send money: \(error.localizedDescription)"
//        }
//    }



    
}

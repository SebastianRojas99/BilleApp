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
    var number:Int = 0
    var type:String = ""
    var expiryDate:String = ""
    var cvv:String = ""
    var credit:Double = 0.00
    var userId = UUID()
    
    func add(context:NSManagedObjectContext){
        let newCard = Card(context:context)
        
        newCard.id = id
        newCard.name = name
        newCard.number = Int16(number)
        newCard.type = type
        newCard.expiryDate = expiryDate
        newCard.cvv = cvv
        newCard.credit = credit
        newCard.userId = userId
        
        do{
            try context.save()
            print("tarjeta guardada")
        }catch{
            print("error al crear una tarjeta")
        }
        
        
    }
}

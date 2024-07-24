//
//  UserVM.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 24/07/2024.
//

import Foundation
import CoreData
import Observation


@Observable
class UserVM{
    
    var name:String = ""
    var lastname:String = ""
    var username:String = ""
    var email:String = ""
    var address:String = ""
    var birthday:Date = Date()
    
    
    func register(context:NSManagedObjectContext){
        let newUser = User(context: context)
        newUser.id = UUID()
        newUser.name = name
        newUser.lastname = lastname
        newUser.username = username
        newUser.email = email
        newUser.address = address
        newUser.birthday = birthday
    }
    
    func login(context:NSManagedObjectContext){
        
    }

}

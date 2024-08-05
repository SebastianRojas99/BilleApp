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
    var image:String = ""
    var password:String = ""
    var role:role = .user
    var state:state = .active
    var loginMessage:String = ""
    var isLogged: Bool = false
    var balance: Decimal = 15000
    var user:User?
    var card:Card?
    var sendMessage:String = ""
    
    
    
    
    
    func isUserRegistered(username: String, context: NSManagedObjectContext) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
        
        do {
            let users = try context.fetch(fetchRequest)
            return !users.isEmpty
        } catch {
            print("Failed to fetch user: \(error.localizedDescription)")
            return false
        }
    }
    
    func register(context:NSManagedObjectContext){
        if isUserRegistered(username: username, context: context) {
                    print("User already registered")
                    return
                }
        let newUser = User(context: context)
        newUser.id = UUID()
        newUser.name = name
        newUser.lastname = lastname
        newUser.username = username
        newUser.email = email
        newUser.address = address
        newUser.password = password
        newUser.birthday = birthday
        newUser.role = role.rawValue
        newUser.state = state.rawValue
        newUser.image = image
        newUser.balance = (balance) as NSDecimalNumber
        
        
        
        do{
            try context.save()
            print("added and working")
            let cardVM = CardVM()
            cardVM.createCardForUser(context: context, userId: newUser.id ?? UUID(), nameAndLast: "\(newUser.name ?? "" + " " + (newUser.lastname ?? ""))")
        }catch{
            print("Failed to register user: \(error.localizedDescription)")
        }
    }
    
    func login(username: String, password: String, context: NSManagedObjectContext) {
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password) //validation for login
            
            do {
                let users = try context.fetch(fetchRequest)
                if users.isEmpty {
                    loginMessage = "Invalid username or password"
                    isLogged = false
                } else {
                    loginMessage = "Login successful"
                    
                    isLogged = true
                    user = users.first                    
                    print("logged")
                }
            } catch {
                loginMessage = "Error: \(error.localizedDescription)"
                isLogged = false
            }
        }
    
        func send(to receiverUsername: String, amount: Decimal, context: NSManagedObjectContext) {
            guard let user = user, let senderAccountAmount = user.balance as Decimal? else {
                sendMessage = "Sender is not logged in or sender account amount is not available"
                return
            }
    
            if senderAccountAmount < amount {
                sendMessage = "Insufficient funds"
                return
            }
    
            
            let userFetchRequest: NSFetchRequest<User> = User.fetchRequest()
            userFetchRequest.predicate = NSPredicate(format: "username == %@", receiverUsername)
    
            do {
                let users = try context.fetch(userFetchRequest)
                if users.isEmpty {
                    sendMessage = "Receiver not found"
                    return
                }
    
                guard let receiver = users.first else {
                    sendMessage = "Failed to get receiver"
                    return
                }
    
                                
    
                // Perform the transaction
                user.balance = (senderAccountAmount - amount) as NSDecimalNumber
                receiver.balance = (senderAccountAmount + amount) as NSDecimalNumber
    
                sendMessage = "Transaction successful"
    
                try context.save()
            } catch {
                print("Failed to send money: \(error.localizedDescription)")
                sendMessage = "Failed to send money: \(error.localizedDescription)"
            }
        }

}


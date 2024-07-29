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
    var accountAmount:Decimal = 15000
    var user:User?
    
    
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
        newUser.accountamount = (accountAmount) as NSDecimalNumber
        newUser.image = image
        
        do{
            try context.save()
            print("added and working")
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
    
    func send(amount: Decimal, to recipientUsername: String, context: NSManagedObjectContext) {
            guard let sender = user else {
                loginMessage = "Error: No user logged in"
                return
            }
            
            if amount <= 0 {
                loginMessage = "Error: Invalid amount"
                return
            }
            
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "username == %@", recipientUsername)
            
            do {
                let recipients = try context.fetch(fetchRequest)
                if recipients.isEmpty {
                    loginMessage = "Error: Recipient not found"
                    return
                }
                
                guard let recipient = recipients.first else {
                    loginMessage = "Error: Recipient not found"
                    return
                }
                
                if sender.accountamount?.decimalValue ?? 0 < amount {
                    loginMessage = "Error: Insufficient funds"
                    return
                }
                
                // Deduct the amount from the sender's account
                sender.accountamount = (sender.accountamount?.decimalValue ?? 0 - amount) as NSDecimalNumber
                
                // Add the amount to the recipient's account
                recipient.accountamount = (recipient.accountamount?.decimalValue ?? 0 + amount) as NSDecimalNumber
                
                try context.save()
                loginMessage = "Transaction successful"
                print("Transaction successful: \(amount) sent from \(sender.username ?? "") to \(recipient.username ?? "")")
                
            } catch {
                loginMessage = "Error: \(error.localizedDescription)"
            }
        }

}

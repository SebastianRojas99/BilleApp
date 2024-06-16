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
    var password:String?
    var hasError = false
    var errorMessage: String? = nil
    
    var userList: [User] = []
    
    func validation(_username:String,_password:String)->Bool{
                if let storedPassword = testFlightCredentials[_username], storedPassword == _password {
                    self.username = _username
                    return true
                }
                return false
            }
}


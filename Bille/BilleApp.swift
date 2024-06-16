//
//  BilleApp.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 14/06/2024.
//

import SwiftUI

@main
struct BilleApp: App {
    @State var userVM = UserVM()
    var body: some Scene {
        WindowGroup {
            RegisterView().environment(userVM)
        }
    }
}

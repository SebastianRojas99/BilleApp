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
    @State var cardVM = CardVM()
    var body: some Scene {
        WindowGroup {
            RegisterModal().environment(userVM).environment(cardVM)
        }
    }
}

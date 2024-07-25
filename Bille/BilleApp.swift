//
//  BilleApp.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 14/06/2024.
//

import SwiftUI

@main
struct BilleApp: App {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    @State var userVM = UserVM()
    @State var cardVM = CardVM()
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                RegisterModal().environment(\.managedObjectContext, persistenceController.container.viewContext).environment(userVM).environment(cardVM)
            } else {
                OnBoardingView(hasSeenOnboarding: $hasSeenOnboarding)
            }
        }
    }
}

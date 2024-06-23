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
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                RegisterModal().environment(userVM).environment(cardVM)
            } else {
                OnBoardingView(hasSeenOnboarding: $hasSeenOnboarding)
            }
        }
    }
}

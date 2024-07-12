//
//  HomeScreen.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 17/06/2024.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(UserVM.self) private var userVM
    @Environment(CardVM.self) private var cardVM
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var selectedCategory = "Dashboard"
    var body: some View{
        VStack{
            switch selectedCategory{
            case "Dashboard":
                Dashboard()
            
            case "Cards":
                CreditCards().environment(userVM)
                
            case "Services":
                ServicesMenu()
            
            case "Profile":
                Profile()
                
            default:
                Dashboard()
            }
            Spacer()
            VStack{
                Navbar(selectedCategory: $selectedCategory)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    
                    
            }
            
        }
    }
    }

#Preview {
    HomeScreen()
}

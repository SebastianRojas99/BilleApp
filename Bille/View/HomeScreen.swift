//
//  HomeScreen.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 17/06/2024.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(UserVM.self)  var userVM
    @Environment(CardVM.self)  var cardVM
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var selectedCategory = "Dashboard"
    var body: some View{
        NavigationStack{
            VStack{
                switch selectedCategory{
                case "Dashboard":
                    Dashboard()
                
                case "Cards":
                    CreditCards().environment(userVM).environment(cardVM)
                    
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
}

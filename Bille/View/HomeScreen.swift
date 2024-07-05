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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        HStack{
                            VStack(alignment: .leading) {
                                Text("Welcome \(userVM.getUser()?.capitalized ?? "Invitado")!")
                                    .foregroundColor(.gray)
                                Text("Dashboard")
                                    .font(.largeTitle)
                                    .bold()
                            }
                            Spacer()
                            Button {
                                isDarkMode.toggle()
                            } label: {
                                Image(systemName: isDarkMode ? "moon.stars" : "sun.max")
                                    .font(.largeTitle)
                                    .foregroundStyle(isDarkMode ? .brown.opacity(0.7) : .yellow)
                            }
                            NavigationLink {
                                CreditCards().environment(userVM)
                            } label: {
                                Image(systemName: "creditcard.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(isDarkMode ? .brown.opacity(0.7) : .yellow)
                            }
                        }
                        
                        
                        HStack {
                            Spacer()
                            BalanceView().environment(userVM)
                            Spacer()
                        }
                        .frame(alignment: .center)
                        .padding(.bottom,5)
                                                
                        
                        VStack(alignment: .leading) {
                            CurrencyMenu()
                                .frame(height: 350)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(15)
                                .padding()
                                .preferredColorScheme(isDarkMode ? .dark : .light)
                        }
                        
                    }
                    .padding()
                    
                    Spacer()
                }
                .padding()
                .environment(userVM)
            }
        }
    }
}

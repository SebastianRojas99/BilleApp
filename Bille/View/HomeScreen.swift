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
            ScrollView{
                VStack(alignment:.leading){
                    VStack(alignment: .leading) {
                        Text("Bille")
                            .font(.title)
                            .bold()
                            .frame(alignment: .leading)
                            .padding()
                                            
                        
                        VStack(alignment: .leading) {
                            Text("Welcome \(userVM.getUser()?.capitalized ?? "Invitado")!")
                                .foregroundColor(.gray)
                            Text("Dashboard")
                                .font(.largeTitle)
                                .bold()
                            HStack{
                                Button{
                                    isDarkMode.toggle()
                                }label: {
                                    Image(systemName: isDarkMode ? "moon.stars" : "sun.max.fill")
                                        .font(.largeTitle)
                                        .foregroundStyle(isDarkMode ? .brown.opacity(0.7) : .yellow)
                                }
                                NavigationLink{
                                    CreditCards().environment(userVM)
                                }label: {
                                    Text("go to my card")
                                }
                            }.padding(.top,2)
                            
                        }.padding()
                    }.padding()
                    
                    
                    
                    VStack(alignment: .leading) {                        
                            CreditCards()
                                .environment(userVM)
                                .frame(height: 350)
                                .cornerRadius(15)
                                .padding() // Añade padding aquí
                                .preferredColorScheme(isDarkMode ? .dark : .light)
                    }.padding() // Y también aquí
                    
                    
                    VStack(alignment: .leading) {
                        CurrencyMenu()
                            .frame(height: 350)
                            .cornerRadius(15)
                            .padding()
                            .preferredColorScheme(isDarkMode ? .dark : .light)
                    }
                    
                    Spacer()
                }
                .padding()
                .environment(userVM)
            }
            
        }
    }
}


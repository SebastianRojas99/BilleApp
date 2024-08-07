//
//  Dashboard.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 08/07/2024.
//

import SwiftUI

struct Dashboard: View {
    @Environment(UserVM.self) private var userVM
    @Environment(CardVM.self) private var cardVM
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var selectedCategory = "Dashboard"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        HStack{
                            VStack(alignment: .leading) {
                                Text("Welcome \(userVM.user?.username ?? "Invitado")!")
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
                                    .foregroundStyle(isDarkMode ? .gray.opacity(0.6) : .yellow)
                            }                            
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Spacer()
                            BalanceView(currencies: CurrencyVM()).environment(userVM)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 5)
                        
                        VStack(alignment: .leading) {
                            CurrencyMenu()
                                .frame(maxWidth: .infinity)
                                .frame(height: 350)
                                .cornerRadius(15)
                                .padding()
                                .preferredColorScheme(isDarkMode ? .dark : .light)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                                        
                }
                .padding()
                .frame(maxWidth: .infinity)
                .environment(userVM)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

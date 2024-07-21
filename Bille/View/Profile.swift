//
//  Profile.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 12/07/2024.
//

import SwiftUI

struct Profile: View {
    @Environment(UserVM.self) private var uservm
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var close:Bool = false
    var body: some View {
        
        NavigationStack{
            Image(uservm.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150,height: 150)
                .clipShape(Circle())
            HStack{
                Text(uservm.name)
                    .font(.largeTitle)
                Text(uservm.lastname)
                    .font(.largeTitle)
            }
                        
            Text(uservm.address)
                .font(.title2)
                .foregroundStyle(.gray)
            Text("\(uservm.birthday.formatted(date: .numeric, time: .omitted))")
                .font(.title3)
                .foregroundStyle(.gray)
            
            Button{
                uservm.logout()
                close = true
            }label: {
                HStack{
                    Image(systemName: "person.fill")
                    Text("Logout")
                        .bold()
                        
                }
                .padding()
                .background(.teal)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(isDarkMode ? .white : .black)
                .navigationDestination(isPresented: $close){
                    ContentView()
                        .navigationBarBackButtonHidden(true)
                }
                
            }

        }
            }
    
}


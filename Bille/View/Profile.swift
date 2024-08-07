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
            ZStack {
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.cyan)
                Text((uservm.user?.name?.prefix(1) ?? "") + (uservm.user?.lastname?.prefix(1) ?? ""))
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
            }
            HStack{
                Text(uservm.user?.name ?? "")
                    .font(.largeTitle)
                Text(uservm.user?.lastname ?? "")
                    .font(.largeTitle)
            }
                        
            Text(uservm.user?.address ?? "")
                .font(.title2)
                .foregroundStyle(.gray)
            Text("\(uservm.user?.birthday!.formatted(date: .numeric, time: .omitted) ?? "No date available")")
                .font(.title3)
                .foregroundStyle(.gray)
            
            Button{
                //uservm.logout()
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


//
//  RegisterModal.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 15/06/2024.
//

import SwiftUI

struct RegisterModal: View {
    @State private var pulsate:Bool = false
    @State private var isPresented:Bool = false
    @Environment(UserVM.self) private var userVM
    @Environment(\.dismiss.self) private var dismiss
    @State private var isLogged:Bool = false
    var body: some View {
        ZStack{
            Button{
                isPresented.toggle()
            }label: {
                Image("walletRegister")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            
            VStack{
                Image(systemName: "creditcard.fill")
                    .resizable()
                    .foregroundStyle(pulsate ? .purple.opacity(1) : .purple.opacity(0.4) )
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.blue)
                    .scaleEffect(pulsate ? 1.2 : 1.0)
                    .padding(.top)
                    .onAppear {
                        withAnimation(
                            Animation.easeInOut(duration: 1.0)
                                .repeatForever(autoreverses: true)
                        ) {
                            self.pulsate = true
                        }
                    }
                
                Text("Welcome to Bille")
                    .font(.system(size: 36))
                    .foregroundStyle(.white)
                    .bold()
                    .fontWeight(.heavy)
                    .shadow(color: .purple, radius: 8)
                    .underline()
                    .padding(.top,20)
                
                Spacer()
            }
            
        }
        .sheet(isPresented: $isPresented, content: {
            LoginView().environment(userVM)
        })
    }
}

#Preview {
    RegisterModal().environment(UserVM())
}

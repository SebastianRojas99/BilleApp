//
//  RegisterModal.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 15/06/2024.
//

import SwiftUI

struct RegisterModal: View {
    @State private var pulsate:Bool = false
    var body: some View {
        ZStack{
            Image("walletRegister")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                Image(systemName: "creditcard.fill")
                    .resizable()
                    .foregroundStyle(.purple)
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
    }
}

#Preview {
    RegisterModal()
}

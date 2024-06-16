//
//  RegisterModal.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 15/06/2024.
//

import SwiftUI

struct RegisterModal: View {
    var body: some View {
        ZStack{
            Image("walletRegister")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
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

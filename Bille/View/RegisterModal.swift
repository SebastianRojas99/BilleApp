//
//  RegisterModal.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 15/06/2024.
//

import SwiftUI

struct RegisterModal: View {
    @State private var pulsate: Bool = false
    @State private var isPresented: Bool = false
    @Environment(UserVM.self) private var userVM
    @Environment(CardVM.self) private var cardVM
    @State private var isLogged: Bool = false
    @State private var showContentView: Bool = false
    
    var body: some View {
        ZStack {
            Button {
                isPresented = true
            } label: {
                Image("walletRegister")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Welcome to Bille")
                    .font(.system(size: 36))
                    .foregroundStyle(.white)
                    .bold()
                    .fontWeight(.heavy)
                    .shadow(color: .purple, radius: 8)
                    .padding(.top, 20)
                
                Spacer()
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                if isLogged {
                    showContentView = true
                }
            }) {
                 LoginView(isLogged: $isLogged)
                    .environment(userVM)
                    .environment(cardVM)
                    .presentationCornerRadius(24)
                    .presentationBackground(.ultraThinMaterial)
                    .presentationDetents([.medium])
            }
            .fullScreenCover(isPresented: $showContentView) {
                HomeScreen().environment(userVM)
            }
        }
        .onChange(of: isLogged) {
            if isLogged {
                isPresented = false
            }
        }
    }
}

#Preview {
    RegisterModal().environment(UserVM()).environment(CardVM())
}

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

                    Image(systemName: "creditcard.fill")
                        .resizable()
                        .foregroundStyle(pulsate ? .purple.opacity(1) : .purple.opacity(0.4))
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
                    .presentationCornerRadius(24)
                    .presentationBackground(.ultraThinMaterial)
                    .presentationDetents([.medium])
            }
            .fullScreenCover(isPresented: $showContentView) {
                HomeScreen()
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
    RegisterModal().environment(UserVM())
}

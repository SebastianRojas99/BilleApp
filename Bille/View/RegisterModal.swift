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
            // Fondo con imagen difuminada
            GeometryReader { geometry in
                Image("walletRegister")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .overlay(.black.opacity(0.3)) // Añade una capa oscura semitransparente si quieres oscurecer la imagen
                    .ignoresSafeArea()
                    .padding(.top,120)
            }
            
            VStack {
            
                
                Text("Welcome to Bille")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: .purple, radius: 8)
                    .padding(.top, 20)
                
                
                VStack(alignment:.leading){
                    ForEach(currencyForLogin,id: \.self){currency in
                        VStack(alignment:.leading){
                            HStack{
                                Text(currency["icon"] ?? "")
                                    .clipShape(Capsule())
                                    .font(.largeTitle)
                                    .background(.gray)
                                    
                                    
                                VStack(alignment:.leading){
                                    Text(currency["name"] ?? "")
                                    Text(currency["unit"] ?? "")
                                }
                            }
                        }
                        
                        
                        
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding()
                        .background(.secondary)
                }
                
                .foregroundStyle(.white)
                .padding(.top,10)
                
                    
                
                Spacer()
                
                Button {
                    isPresented = true
                } label: {
                    Text("Get Started")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.teal.opacity(0.4))
                        .cornerRadius(25)
                        .shadow(color: .purple, radius: 8)
                        
                }
                .padding(.bottom, 50)
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
        .background(Color.black)
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

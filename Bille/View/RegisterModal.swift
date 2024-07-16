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
    @State var degreesRotating = 0.0
    
    var body: some View {
        ZStack {
            // Fondo con imagen difuminada
            GeometryReader { geometry in
                        Image("walletRegister")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                            .overlay(Color.black.opacity(0.3)) // Añade una capa oscura semitransparente si quieres oscurecer la imagen
                            .rotationEffect(.degrees(degreesRotating), anchor: .center) // Ajuste del punto de anclaje al centro
                            .onAppear {
                                withAnimation(Animation.linear(duration: 20)
                                    .repeatForever(autoreverses: false)) {
                                        degreesRotating = 360.0
                                    }
                            }
                    }
                    .ignoresSafeArea()
            
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
                                    .padding(5)
                                    .font(.largeTitle)
                                    .background(.gray)
                                    .clipShape(Circle())
                                    
                                    
                                VStack(alignment:.leading){
                                    Text(currency["name"] ?? "")
                                        .bold()
                                    Text(currency["unit"] ?? "")
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        
                        
                        
                    }
                    .frame(width:350, alignment: .leading)
                        .padding()
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        
                }
                .foregroundStyle(.white)
                .padding(.top,10)
                
                    
                
                Spacer()
                
                //BUTTON
                
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

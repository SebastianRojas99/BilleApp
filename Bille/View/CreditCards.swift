//
//  CreditCards.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 18/06/2024.
//

import SwiftUI

struct CreditCards: View {
    @Environment(UserVM.self) private var userVM
    @Environment(CardVM.self) private var cardVM
    @State private var isShow:Bool = false
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text("My Cards")
                    .font(.largeTitle)
                    .bold()
                    .frame(alignment: .leading)
                    
                
                Button{
                    isShow.toggle()
                }label: {
                    Text("show")
                }.buttonStyle(.borderedProminent).padding(.horizontal)
                
                NavigationLink{
                    NewCardModal()
                        .environment(cardVM)
                        .environment(userVM)
                }label: {
                    Image(systemName: "plus")
                }.buttonStyle(.borderedProminent).padding(.horizontal)
            }.padding(.top,12)
            
            
            ForEach(userVM.userCards, id: \.self){item in
                                
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(isShow ? item.number : String(repeating: "*", count: max(0, item.number.count - 4)) + item.number.suffix(5))
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding(.top, 5)
                                    HStack {
                                        Text(item.expiryDate)
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text("CVV:  \(isShow ? item.cvv : "***")")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.top, 5)
                                }
                                Spacer()
                                VStack {
                                    if item.typeCard == "Visa" {
                                        Image("visa_logo") // Asegúrate de tener una imagen llamada visa_logo en tus assets
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 30)
                                    } else if item.typeCard == "MasterCard" {
                                        Image("mastercard_logo") // Asegúrate de tener una imagen llamada mastercard_logo en tus assets
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 30)
                                    }
                                }
                            }
                            .padding()
                        }
                        .frame(width: 350, height: 200)
                        .background(item.typeCard == "Visa" ? LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing): LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .padding(.top,10)
            }
        }.frame(maxWidth:.infinity,maxHeight:.infinity)
    }
}


//
//  CreditCards.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 18/06/2024.
//

import SwiftUI

struct CreditCards: View {
    @Environment(UserVM.self)  var userVM
    @Environment(CardVM.self)  var cardVM
    @Environment(\.dismiss.self) var dismiss
    @State private var selectedCard: Card?
    @State private var isShow: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("My Cards")
                    .font(.title2)
                    .bold()
                    .frame(alignment: .leading)
                
                Button {
                    isShow.toggle()
                } label: {
                    Text("show")
                }.buttonStyle(.borderedProminent).padding(.horizontal,5)
                
                NavigationLink {
                    NewCardModal()
                        .environment(cardVM)
                        .environment(userVM)
                } label: {
                    Image(systemName: "plus")
                }.buttonStyle(.borderedProminent).padding(.horizontal)
            }.padding(.top, 12)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(userVM.userCards, id: \.self) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(isShow ? item.number : String(repeating: "*", count: max(0, item.number.count - 4)) + item.number.suffix(4))
                                    .font(.system(size:18))
                                    .foregroundColor(.white)
                                    .padding(.top, 5)
                                HStack {
                                    Text(item.expiryDate)
                                        .foregroundColor(.white)
                                        .font(.system(size:16))
                                    Spacer()
                                    Text("CVV:  \(isShow ? item.cvv : "***")")
                                        .foregroundColor(.white)
                                        .font(.system(size:16))
                                }
                                .padding(.top, 5)
                            }
                            Spacer()
                            VStack {
                                if item.typeCard == "Visa" {
                                    Image("visa_logo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 30)
                                } else if item.typeCard == "MasterCard" {
                                    Image("mastercard_logo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 30)
                                }
                            }
                        }
                        .padding()
                        .frame(width: 280, height: 150)
                        .background(item.typeCard == "Visa" ? LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .onLongPressGesture{
                            selectedCard = item
                        }
                        .contextMenu {
                            Button(role:.destructive){
                                if let card = selectedCard {
                                    userVM.deleteCard(card, userVM.username ?? "")
                                }
                            }label:{
                                HStack{
                                    Text("delete")
                                    Image(systemName: "trash")
                                }
                                
                            }
                        }
                        }.padding(.horizontal)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }

//
//  CreditCardTest.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 18/06/2024.
//

import SwiftUI

struct CreditCardTest: View {
    @State var isShow = false
    var body: some View {
        let cardHolderName: String = "John Doe"
        let cardNumber: String = "1234 5678 9012 3456"
        let expiryDate: String = "12/25"
        let cvv: String = "123"
        let cardType: String = "MasterCard"
        let cardNumberMasked = String(repeating: "*", count: max(0, cardNumber.count - 4)) + cardNumber.suffix(5)
        
        Button{
            isShow.toggle()
        }label: {
            Text("show")
        }.buttonStyle(.borderedProminent)
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(cardHolderName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(isShow ? cardNumber : cardNumberMasked)
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(.top, 5)
                            HStack {
                                Text("Exp: \(expiryDate)")
                                    .foregroundColor(.white)
                                Spacer()
                                Text("CVV:  \(isShow ? cvv: "***")")
                                    .foregroundColor(.white)
                            }
                            .padding(.top, 5)
                        }
                        Spacer()
                        VStack {
                            if cardType == "Visa" {
                                Image("visa_logo") // Asegúrate de tener una imagen llamada visa_logo en tus assets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 30)
                            } else if cardType == "MasterCard" {
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
                .background(cardType == "Visa" ? LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing): LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(15)
                .shadow(radius: 10)
            }
        }
    

#Preview {
    CreditCardTest()
}

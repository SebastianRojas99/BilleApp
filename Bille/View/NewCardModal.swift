//
//  NewCardModal.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 20/06/2024.
//

import SwiftUI

struct NewCardModal: View {
    @State private var cardNumber: String = ""
    @State private var cardHolderName: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""
    @State private var cardType: String = ""
    @Environment(CardVM.self) private var cardVM
    @Environment(UserVM.self) private var userVM
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Add New Card")
                    .font(.largeTitle)
                    .bold()
            }
            Spacer()
            
            TextField("Enter card holder name", text: $cardHolderName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            TextField("Enter your card number", text: $cardNumber)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            TextField("Enter expiry date (MM/YY)", text: $expiryDate)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            TextField("Enter CVV", text: $cvv)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            TextField("Enter card type (e.g., Visa, MasterCard)", text: $cardType)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            Button(action: {
                let newCard = Card(name: cardHolderName, typeCard: cardType, number: cardNumber, expiryDate: expiryDate, cvv: cvv, credit: 0.0)
                cardVM.addCardToUser(card: newCard, email: userVM.username ?? "")
            }) {
                Text("Add Card")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}



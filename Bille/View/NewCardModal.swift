//
//  NewCardModal.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 20/06/2024.
//

import SwiftUI

struct NewCardModal: View {
    let types = ["VISA","MASTER CARD","AMERICAN EXPRESS", "MERCADO PAGO"]
    @State private var number: String = ""
    @State private var name: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""
    @State private var type: String = ""
    @Environment(UserVM.self) private var userVM
    @Environment(\.managedObjectContext) private var context
    @State private var cardVM = CardVM()
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Add New Card")
                    .font(.largeTitle)
                    .bold()
            }
            
            TextField("Enter card holder name", text: $name)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            TextField("Enter your card number", text: $number)
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
            
            Picker("", selection: $cardVM.type, content: {
                ForEach(types,id: \.self){
                    Text($0)
                }
            }).pickerStyle(.segmented)
            
            Button(action: {
                cardVM.name = name
                cardVM.number = number
                cardVM.type = type
                cardVM.expiryDate = expiryDate
                cardVM.cvv = cvv
                
                if let loggedUser = userVM.user {
                    cardVM.add(context: context,loggedUser: loggedUser.id ?? UUID())
                } else {
                    
                    print("Error: No user logged in")
                }
            }) {
                Text("Add Card")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}



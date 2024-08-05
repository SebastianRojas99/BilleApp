//
//  SendView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 22/07/2024.
//
import SwiftUI

struct SendView: View {
    @Environment(UserVM.self) private var userVM
    @Environment(CardVM.self) private var cardVM
    @Environment(\.managedObjectContext) private var context
    @State private var username: String = ""
    @State private var money: String = ""
    @State var actualBalance: Decimal = 0
    @State private var transactionMessage: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                Text("Transfer")
                    .font(.largeTitle)
                Text("Your amount: \(actualBalance)")
                    .padding()
                    .onAppear{
                        actualBalance = (userVM.user?.balance ?? 0) as Decimal
                    }

                VStack {
                    TextField("Enter the username", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .font(.title3)
                    TextField("Enter the amount", text: $money)
                        .textFieldStyle(.roundedBorder)
                        .font(.title3)
                        .keyboardType(.decimalPad)
                }
                .padding()

                Button {
                    guard let amount = Decimal(string: money), amount > 0 else {
                        transactionMessage = "Invalid amount"
                        return
                    }
                    userVM.send(to: username, amount: Decimal(string:money) ?? 0 , context: context)
                    transactionMessage = cardVM.sendMessage
                } label: {
                    Text("Send")
                }
                .padding()
                .bold()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Text(transactionMessage)
                    .foregroundStyle(transactionMessage.contains("successful") ? .green : .red)
                    .padding()

                Spacer()
            }
            .navigationTitle("Send Money")
            .padding()
        }
    }
}

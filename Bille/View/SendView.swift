//
//  SendView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 22/07/2024.
//

import SwiftUI

struct SendView: View {
    @Environment(UserVMT.self) private var userVM
    @State  var username:String = ""
    @State  var money:String = ""
    var body: some View {
        NavigationStack{
            VStack{
                Text("Transfer")
                    .font(.largeTitle)
                Text("your amount \(userVM.amount ?? 0)")
                VStack{
                    TextField("Enter the username",text: $username)
                        .textFieldStyle(.roundedBorder).font(.title3)
                    TextField("Enter the amount",text: $money)
                        .textFieldStyle(.roundedBorder).font(.title3).keyboardType(.numberPad)
                }.padding()
                
                Button{
                    userVM.send(username, money:Int(money) ?? 0 )
                }label: {
                    Text("Send")
                }
                    .padding()
                    .bold()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Spacer()
            }.navigationTitle("Send wall").padding()
        }
    }
}



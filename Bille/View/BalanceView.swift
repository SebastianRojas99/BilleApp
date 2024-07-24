//
//  BalanceView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 03/07/2024.
//

import SwiftUI

struct BalanceView: View {
    @Environment(UserVMT.self) private var userVM
    @State var currencies:CurrencyVM?
    @State var isPresented:Bool = false
    var body: some View {
        VStack(alignment:.center){
            Text("Total balance")
                .font(.callout)
                .foregroundStyle(.white)
                .frame(alignment: .center)
                
                            
            Text("$\(userVM.amount ?? 0)")
                .font(.system(size:50))
                .bold()
                .frame(alignment: .center)
                .padding(.bottom,5)
                
            
            HStack {
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "arrow.up.circle")
                            .foregroundStyle(.black)
                        Text("Withdraw")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 12)
                    .frame(width: 140, height: 45)
                    .background(Color.green)
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                }
                
                Button {
                    isPresented = true
                } label: {
                    HStack {
                        Image(systemName: "arrow.down.circle")
                            .foregroundStyle(.black)
                        Text("Deposit")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 12)
                    .frame(width: 140, height: 45)
                    .background(Color.pink)
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    .navigationDestination(isPresented: $isPresented){
                        SendView().environment(userVM)
                    }
                }
            }
            .padding(.top, 5)
            
        }
        .padding(.all,35)
        .background(LinearGradient(colors: [.pink,.pink,.white], startPoint: .top, endPoint: .bottom))
              
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    BalanceView().environment(UserVMT())
}

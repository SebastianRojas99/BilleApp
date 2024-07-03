//
//  BalanceView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 03/07/2024.
//

import SwiftUI

struct BalanceView: View {
    @Environment(UserVM.self) private var userVM
    var body: some View {
        VStack(alignment:.center){
            Text("Total balance")
                .font(.callout)
                .foregroundStyle(.gray)
                .frame(alignment: .center)
                            
            Text("$\(userVM.amount ?? 0)")
                .font(.system(size:50))
                .bold()
                .frame(alignment: .center)
                .padding(.bottom,5)
            
            HStack {
                Button {
                    // Acción para el botón de Transfer
                } label: {
                    HStack {
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.black)
                        Text("Send")
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
                    // Acción para el botón de Income
                } label: {
                    HStack {
                        Image(systemName: "arrow.down")
                            .foregroundStyle(.black)
                        Text("Receive")
                            .font(.title3)
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 12)
                    .frame(width: 140, height: 45)
                    .background(Color.pink)
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                }
            }
            .padding(.top, 5)
            
        }
        .padding(.top, 10)
    }
}

#Preview {
    BalanceView().environment(UserVM())
}

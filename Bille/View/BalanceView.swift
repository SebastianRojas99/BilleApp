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
            
            HStack{
                Button {
                        } label: {
                            Text("Transfer")
                                .font(.title)
                                .foregroundStyle(.white)
                                .padding(.horizontal,12)
                                .frame(width: 140, height: 45)
                                .background(.green)
                                .clipShape(Capsule())
                                .shadow(radius: 10)
                        }
                Button {
                        } label: {
                            HStack{
                                Image(systemName: "arrow.down")
                                Text("Income")
                                    .font(.title)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal,12)
                                    .frame(width: 140, height: 45)
                                    .background(.pink)
                                    .clipShape(Capsule())
                                    .shadow(radius: 10)
                            }
                            
                        }
            }
            
            
        }.padding(.top,10)
    }
}

#Preview {
    BalanceView().environment(UserVM())
}

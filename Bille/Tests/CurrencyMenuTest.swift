//
//  CurrencyMenuTest.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 17/06/2024.
//

import SwiftUI

struct CurrencyMenuTest: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(1...10, id: \.self) {_ in
                    HStack {
                        Text("$")
                            .font(.system(size: 15))
                            .padding(.all, 5)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1))
                            .frame(width: 35, height: 30)
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .background(Color.red.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        
                        VStack(alignment: .leading) {
                            Text("dolarito")
                                .font(.title2)
                                .foregroundColor(.gray)
                            
                            Text("10000")
                                .bold()
                        }
                        .padding()
                        
                        Spacer()
                        
                        Button {
                            // going to currency menu
                        } label: {
                            Image(systemName: "arrow.right")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            
            
        }.colorScheme(.dark)
    }
}
#Preview {
    CurrencyMenuTest()
}

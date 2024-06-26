//
//  CurrencyMenu.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 17/06/2024.
//

import SwiftUI

struct CurrencyMenu: View {
    @State var currencyVM = CurrencyVM()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(currencyVM.currencyList, id: \.self) { item in
                        if item.type == "fiat" {
                            VStack {
                                HStack {
                                    Text("\(item.unit)")
                                        .font(.system(size: 15))
                                        .padding(.all, 5)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                                        .frame(width: 35, height: 30)
                                        .foregroundColor(.white)
                                        .padding(.all, 10)
                                        .background(Color.red.opacity(0.4))
                                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                    
                                    VStack(alignment: .leading) {
                                        Text("\(item.name)")
                                            .font(.title2)
                                            .foregroundColor(.gray)
                                        
                                        Text("\(item.value / currencyVM.dolarValue())")
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
                    }
                }
                
            }.preferredColorScheme(.dark)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Asegurarse de que se ajusta al contenedor
    }
}
#Preview {
    CurrencyMenu()
}

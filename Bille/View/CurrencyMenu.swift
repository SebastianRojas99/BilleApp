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
                                        .font(.system(size: 14))
                                        .padding(.all, 5)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .frame(width: 35, height: 30)
                                        .foregroundColor(.white)
                                        .padding(.all, 10)
                                        .background(Color.red.opacity(0.4))
                                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                    VStack(alignment: .leading) {
                                        Text("\(item.name)")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        
                                        
                                    }
                                    .padding()
                                    
                                    Spacer()
                                    
                                    Text("\(item.value / currencyVM.dolarValue())")
                                        .bold()
                                        .font(.caption)
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

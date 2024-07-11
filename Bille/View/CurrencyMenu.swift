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
                                    
                                    Text(String(format: "%.2f", item.value / currencyVM.dolarValue()))
                                        .bold()
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity) // Asegurarse de que el HStack ocupe todo el ancho
                            }
                            .padding(.vertical, 5) // Espacio entre las celdas de la lista
                        }
                    }
                }
                .listStyle(PlainListStyle()) // Estilo de lista plano
                .frame(maxWidth: .infinity) // Asegurarse de que la lista ocupe todo el ancho
            }
            .preferredColorScheme(.dark)
            .frame(maxWidth: .infinity) // Asegurarse de que el VStack ocupe todo el ancho
        }
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Asegurarse de que NavigationStack ocupe todo el ancho y alto
    }
}

#Preview {
    CurrencyMenu()
}

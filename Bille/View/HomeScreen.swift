//
//  HomeScreen.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 17/06/2024.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack{
            Text("Bille")
                .font(.largeTitle)
                .bold()
            NavigationLink{
                CurrencyMenu()
            }label: {
                Text("coins!")
                    .foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    HomeScreen()
}

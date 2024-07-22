//
//  SendView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 22/07/2024.
//

import SwiftUI

struct SendView: View {
    @Environment(UserVM.self) private var userVM
    var body: some View {
        NavigationStack{
            VStack{
                Text("Transfer")
                    .font(.largeTitle)
                Text("your amount \(userVM.amount ?? 0)")
                //TextField()
            }.navigationTitle("Send wall")
        }
    }
}

#Preview {
    SendView().environment(UserVM())
}

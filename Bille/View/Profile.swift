//
//  Profile.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 12/07/2024.
//

import SwiftUI

struct Profile: View {
    @Environment(UserVM.self) private var uservm
    var body: some View {
        //Text(uservm.username ?? "invitado")
        Text("👷🏼‍♂️⚒️ ASAP Profile")
            .font(.largeTitle)
        
    }
}

#Preview {
    Profile()
}

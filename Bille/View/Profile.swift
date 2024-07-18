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
        Text(uservm.name)
        Text(uservm.lastname)
        Text(uservm.address)
        Text("\(uservm.birthday.formatted(date: .numeric, time: .omitted))")
        Text("👷🏼‍♂️⚒️ ASAP Profile")
            .font(.largeTitle)
        
    }
}


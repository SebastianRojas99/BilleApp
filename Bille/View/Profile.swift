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
        Image(uservm.image)
            .resizable()
            .scaledToFit()
            .frame(width: 150,height: 150)
            .clipShape(Circle())
        HStack{
            Text(uservm.name)
                .font(.largeTitle)
            Text(uservm.lastname)
                .font(.largeTitle)
        }
                    
        Text(uservm.address)
            .font(.title2)
            .foregroundStyle(.gray)
        Text("\(uservm.birthday.formatted(date: .numeric, time: .omitted))")
            .font(.title3)
            .foregroundStyle(.gray)
    }
}


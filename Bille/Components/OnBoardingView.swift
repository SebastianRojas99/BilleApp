//
//  OnBoardingView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 22/06/2024.
//

import SwiftUI

struct OnBoardingView: View {
    
    var body: some View {
        
        TabView{
            OnBoardingCreation(image: "arrow.left.arrow.right", title: "Manage", description: "Manage your incomes and outcomes")
            OnBoardingCreation(image: "creditcard.and.123", title: "Buy", description: "Buy all services")
            OnBoardingCreation(image: "newspaper", title: "See", description: "See your resume and bill")
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        
        
    }
}

#Preview {
    OnBoardingView()
}

struct OnBoardingCreation:View {
    var image:String
    var title:String
    var description:String
    
    var body: some View {
        
        VStack{
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width:100 ,height:100 )
                .foregroundStyle(.pink)
            
            Text(title)
                .font(.title).bold()
            
            Text(description)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }.padding(.horizontal,40)
    }
}

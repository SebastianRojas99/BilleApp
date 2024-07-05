//
//  NavBarView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 03/07/2024.
//

import SwiftUI

struct NavBarView: View {
    var body: some View {
        HStack{
            ScrollView{
                VStack{
                    HStack{
                        NavigationLink{
                            CreditCards()
                        }label: {
                            Image(systemName: "arrow.right")
                                .foregroundStyle(.black)
                                .font(.title)
                        }
                        NavigationLink{
                            
                        }label: {
                            Image(systemName: "arrow.right")
                                .foregroundStyle(.black)
                                .font(.title)
                        }
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    NavBarView()
}

//
//  Dashboard.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 08/07/2024.
//

import SwiftUI

struct Dashboard: View {
    //@State var category:CategoryVM
    //@Binding var selectedCategory: String
    var body: some View {
        HStack{
            ForEach(0...3,id:\.self){ item in
                HStack{
                    HStack{
                        Button{
                            
                        }label: {
                            Image(systemName: "arrow.right")
                                .foregroundStyle(.white)
                            
                        }
                        Text("icon")
                    }
                }
                                
            }
        }
        .padding()
        .background(.green)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

#Preview {
    Dashboard()
}

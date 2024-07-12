//
//  Navbar.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 12/07/2024.
//

import SwiftUI

struct Navbar: View {
    @State var viewModel = CategoryVM(categoryList: categoryList)
    @Binding var selectedCategory: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.categoryList) { item in
                    Button(action: {
                        selectedCategory = item.title
                    }) {
                        HStack {
                            Image(systemName: item.icon)
                                .scaledToFill()
                                .imageScale(.medium)
                                .padding()
                                .foregroundStyle(selectedCategory == item.title ? .white : .black)
                                .background(selectedCategory == item.title ? Color.black : Color.gray.opacity(0.3))
                                .clipShape(Circle())
                            
                            if item.title != "All" && selectedCategory == item.title {
                                Text(item.title)
                                    .foregroundColor(.black)
                            } else if item.title == "All" {
                                Text("All")
                                    .foregroundColor(.black)
                            }
                        }
                        .animation(.easeInOut, value: selectedCategory)
                    }
                }
            }            
        }
        .padding()
        .background(.green)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .frame(maxWidth: .infinity)
    }

}


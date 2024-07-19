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
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.categoryList) { item in
                    Button(action: {
                        selectedCategory = item.title
                    }) {
                        HStack {
                            Image(systemName: item.icon)
                                .scaledToFit()
                                .imageScale(.large)
                                .padding()
                                .foregroundStyle(selectedCategory == item.title ? .white : .gray.opacity(0.6))
                                .background(isDarkMode ? .black : .black.opacity(0))
                                .clipShape(Circle())
                            
                            if item.title != "All" && selectedCategory == item.title {
                                Text(item.title)
                                    .foregroundStyle(isDarkMode ? .white : .black)
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
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .frame(maxWidth: .infinity)
    }

}


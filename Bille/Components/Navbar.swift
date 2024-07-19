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
         
            HStack {
                ForEach(viewModel.categoryList) { item in
                    Button(action: {
                        selectedCategory = item.title
                    }) {
                        VStack {
                            Image(systemName: item.icon)
                                .scaledToFit()
                                .imageScale(.large)
                                .padding()
                                .foregroundStyle(selectedCategory == item.title ? (isDarkMode ? .white : .black) : Color.gray.opacity(0.6))
                                .background(isDarkMode ? Color.black : Color.black.opacity(0))
                                .clipShape(Circle())

                            
                                Text(item.title)
                                    .foregroundStyle(isDarkMode ? .white : .black)
                                    .font(.caption2)
                                    
                        }
                        .animation(.easeInOut, value: selectedCategory)
                    }
                }.padding(.horizontal,10)
        }
        .padding()
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .frame(maxWidth: .infinity)
    }

}


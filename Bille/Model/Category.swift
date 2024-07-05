//
//  Category.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 04/07/2024.
//

import Foundation


struct Category:Identifiable,Codable,Hashable{
       var id: UUID = .init()
       var icon:String
       var title:String
}

var categoryList:[Category] = [
    Category(icon: "", title: "All"),
    Category(icon: "figure.run", title: "Running"),
    Category(icon: "basketball", title: "Basketball"),
    Category(icon: "figure", title: "StreetWear"),
]

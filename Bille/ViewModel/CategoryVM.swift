//
//  CategoryVM.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 07/07/2024.
//

import Foundation
import Observation


@Observable
class CategoryVM{
    var categoryList:[Category]
    
    init(categoryList: [Category]) {
        self.categoryList = categoryList
    }
}

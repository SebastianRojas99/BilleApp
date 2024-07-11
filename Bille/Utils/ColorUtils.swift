//
//  ColorUtils.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 11/07/2024.
//

import Foundation
import SwiftUI

extension Category{
    var color:Color{
        switch title{
        case "Dashboard":
            return .green
        case "Cards":
            return .red
            
        case "Services":
            return .indigo
            
        case "Profile":
            return .blue
            
        default:
            return .green
        }
        
    }
}

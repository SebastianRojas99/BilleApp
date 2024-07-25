//
//  TextFieldsUtils.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 25/07/2024.
//

import SwiftUI

struct CharacterLimitModifier: ViewModifier {
    @Binding var text: String
    var limit: Int
    var showText:Bool
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            content
                .onChange(of: text) {
                    if text.count > limit {
                        text = String(text.prefix(limit))
                    }
                }
            if showText{
                Text("maximo \(limit) caracteres")
                    .font(.caption)
                    .foregroundColor(text.count > limit ? .red : .gray)
            }
            
        }
    }
}



struct MinLimitModifier: ViewModifier {
    @Binding var text: String
    @State var minRequired: Int
    @State var passed:Bool
    
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            content
                .onChange(of: text) {
                    if text.count < minRequired {
                        passed = false
                    }
                    passed = true
                }
            
                Text(passed ? "" : "minimum \(minRequired) characters")
                    .font(.caption)
                    .foregroundColor(text.count < minRequired ? .red : .gray)
            
        }
    }
}



extension View {
    func maxLength(text: Binding<String>, length: Int,show:Bool) -> some View {
        self.modifier(CharacterLimitModifier(text: text, limit: length, showText: show))
    }
    
}

extension View {
    func minLength(text: Binding<String>, length: Int,show:Bool) -> some View {
        self.modifier(MinLimitModifier(text: text, minRequired: length, passed: show))
    }
    
}

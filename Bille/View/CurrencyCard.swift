//
//  CurrencyCard.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 17/06/2024.
//

//import SwiftUI
//
//struct CurrencyCard: View {
//    @State var currencyVM = CurrencyVM()
//    var body: some View {
//        VStack{
//            HStack{
//                Text("\(currencyVM.currency.type)")
//                    .font(.system(size: 15))
//                    .padding(.all,5)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
//                    .frame(width: 35, height: 30)
//                    .foregroundColor(.white)
//                    .padding(.all,10)
//                    .background(Color.red.opacity(0.4))
//                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
//                
//                    
//                VStack{
//                    Text("\(currencyVM.currency.name )")
//                        .font(.title2)
//                        .foregroundStyle(.gray)
//                    
//                    
//                    Text("\(currencyVM.currency.value)")
//                        .bold()
//                }.padding()
//                
//                Button{
//                    //going to currency menu
//                }label: {
//                    Image(systemName: "arrow.right")
//                        .foregroundStyle(.red)
//                }
//            }
//        }
//    }
//}

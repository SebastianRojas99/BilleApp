//
//  CreditCards.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 18/06/2024.
//

import SwiftUI
import CoreData

struct CreditCards: View {
    var user:User
    var cards: FetchRequest<Card>
    init(user:User){
        self.user = user
        cards = FetchRequest<Card>(entity: Card.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)],predicate: NSPredicate(format: "userId == %@", user.id! as CVarArg))
    }
    @State var creditNumber = ""
    @Environment(UserVM.self)  var userVM
    @Environment(CardVM.self)  var cardVM
    @Environment(\.dismiss.self) var dismiss
    //@State private var selectedCard: Card
    @State private var isShow: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("My Cards")
                    .font(.title2)
                    .bold()
                    .frame(alignment: .leading)
                
                Button {
                    isShow.toggle()
                } label: {
                    Text("show")
                }.buttonStyle(.borderedProminent).padding(.horizontal,5)
                
                NavigationLink {
                    NewCardModal()
                        .environment(cardVM)
                        .environment(userVM)
                } label: {
                    Image(systemName: "plus")
                }.buttonStyle(.borderedProminent).padding(.horizontal)
            }.padding(.top, 12)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(cards.wrappedValue){ item in
                        VStack{
                            Text(item.name ?? "")
                            Text(item.number ?? "")
                            Text(item.expiryDate ?? "")
                        }.onAppear{
                            //creditNumber = number?.replacingOccurrences(of: "(\\d{4})(\\d{4})(\\d{4})(\\d{4})", with: "$1 $2 $3 $4",options: .regularExpression,range: nil) ?? number ?? ""
                        }
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

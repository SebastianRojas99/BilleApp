//
//  CreditCards.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 18/06/2024.
//

import SwiftUI

struct CreditCards: View {
    var user: User
    @FetchRequest var cards: FetchedResults<Card>

    init(user: User) {
        self.user = user
        self._cards = FetchRequest<Card>(
            entity: Card.entity(),
            sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)],
            predicate: NSPredicate(format: "userId == %@", user.id! as CVarArg)
        )
    }

    @State private var color1: Color = .blue
    @State private var color2: Color = .purple
    @State private var creditNumber = ""
    @Environment(UserVM.self) private var userVM
    @Environment(CardVM.self) private var cardVM
    @Environment(\.dismiss) var dismiss
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
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 5)
                
                NavigationLink {
                    NewCardModal()
                        .environment(cardVM)
                        .environment(userVM)
                } label: {
                    Image(systemName: "plus")
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
            }
            .padding(.top, 12)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(cards) { item in
                        VStack {
                            ZStack {
                                // Background Image
                                if let imageName = getImageName(for: item.type) {
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 300, height: 200)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                                
                                // Background Gradient
                                LinearGradient(colors: getCardColors(for: item.type), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .opacity(0.3) // Adjust opacity as needed
                                
                                // Card Content
                                VStack(alignment: .leading) {
                                    Text(item.number ?? "")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                        .bold()
                                    Spacer()
                                    HStack {
                                        Text(item.type ?? "")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                        Spacer()
                                        VStack(alignment: .leading) {
                                            Text(item.expiryDate ?? "")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                            Text(item.cvv ?? "")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                            
                                        }
                                    }
                                }
                                .padding(8)
                            }
                        }
                        .frame(width: 300, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onAppear {
                            creditNumber = item.number?.replacingOccurrences(of: "(\\d{4})(\\d{4})(\\d{4})(\\d{4})", with: "$1 $2 $3 $4", options: .regularExpression, range: nil) ?? item.number ?? ""
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    //DESIGN FUNCTIONS
    
    func getCardColors(for cardType: String?) -> [Color] {
        switch cardType {
        case "MASTERCARD":
            return [.orange, .yellow]
        case "MERCADOPAGO":
            return [.black.opacity(0.7), .gray.opacity(0.5)]
        case "AMERICAN EXPRESS":
            return [Color(red: 229/255, green: 228/255, blue: 226/255), Color(red: 192/255, green: 192/255, blue: 192/255)]
        case "BILLE CARD":
            return [.black.opacity(0.7), .black.opacity(0.5)]
        default:
            return [.blue, .purple]
        }
    }

    func getImageName(for cardType: String?) -> String? {
        switch cardType {
        case "BILLE CARD":
            return "cardFont"
        default:
            return nil
        }
    }

}

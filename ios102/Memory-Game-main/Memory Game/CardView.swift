//
//  CardView.swift
//  Memory Game
//
//  Created by Fiyinfoluwa Afolayan on 2/18/25.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let emoji: String
    var isFlipped: Bool = false
    var isMatched: Bool = false
}


struct CardView: View {
    var card: Card
    var didTap: () -> Void // Closure to notify `ContentView`

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18.0)
                .fill(card.isFlipped ? .white : .blue)
                .stroke(card.isFlipped ? .black : .blue, lineWidth: 2)

            if card.isFlipped {
                Text(card.emoji)
                    .font(.system(size: 40))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .frame(width: 110, height: 150)
        .opacity(card.isMatched ? 0 : 1)
        .onTapGesture {
            if !card.isMatched { // ✅ Prevent taps on matched cards
                            didTap()
                        }
        }
        .rotation3DEffect(.degrees(card.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .animation(.default, value: card.isFlipped)
    }
}

#Preview {
    CardView(card: Card(emoji: "🐶", isFlipped: true)) {
        print("Card tapped")
    }
}

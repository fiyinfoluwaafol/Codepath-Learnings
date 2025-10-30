//
//  ContentView.swift
//  Memory Game
//
//  Created by Fiyinfoluwa Afolayan on 2/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var cards: [Card] = [
        Card(emoji: "💀"), Card(emoji: "💀"),
        Card(emoji: "🐶"), Card(emoji: "🐶"),
        Card(emoji: "🐱"), Card(emoji: "🐱"),
        Card(emoji: "🐭"), Card(emoji: "🐭"),
        Card(emoji: "🐸"), Card(emoji: "🐸"),
        Card(emoji: "🦊"), Card(emoji: "🦊"),
        Card(emoji: "🐯"), Card(emoji: "🐯"),
        Card(emoji: "🐷"), Card(emoji: "🐷"),
        Card(emoji: "🐹"), Card(emoji: "🐹"),
        Card(emoji: "🐰"), Card(emoji: "🐰")
    ].shuffled()

    @State private var flippedCards: [Int] = [] // Track flipped card indices
    
    @State private var showPicker = false
    @State private var numberOfPairs: Int = 2

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        VStack {
            
            HStack {
                // ✅ Reset Button
                Button(action: {
                    resetGame() // Calls the function we wrote earlier
                }) {
                    Text("Reset Game")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                
                Button(action: {
                    showPicker.toggle() // ✅ Toggle picker visibility
                }) {
                    Text("Choose Size")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .sheet(isPresented: $showPicker) {
                    VStack {
                        Text("Select Number of Pairs")
                            .font(.headline)
                            .padding()

                        Picker("Pairs", selection: Binding(
                            get: { numberOfPairs },
                            set: { newValue in
                                numberOfPairs = newValue
//                                resetGame() // ✅ Trigger game reset immediately when user picks a value
                                /*showPicker = false*/ // ✅ Close the picker
                            }
                        )) {
                            ForEach([2, 4, 6, 8, 10], id: \.self) { num in
                                Text("\(num) Pairs")
                            }
                        }
                        .pickerStyle(WheelPickerStyle()) // ✅ Uses a scrolling wheel UI
                        .padding()

                        Button("Done") {
                            resetGame()
                            showPicker = false
                        }
                        .padding()
                    }
                    .presentationDetents([.fraction(0.3)]) // ✅ Adjust sheet height
                }


                       
            }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(cards.indices, id: \.self) { index in
                        CardView(card: cards[index]) {
                            flipCard(at: index)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxHeight: .infinity)
        }

    }

    func flipCard(at index: Int) {
        if flippedCards.contains(index) {
            // ✅ If user taps the same card again, remove it from flippedCards
            flippedCards.removeAll { $0 == index }
            cards[index].isFlipped.toggle()
            return
        }

        if flippedCards.count < 2 {
            cards[index].isFlipped.toggle()
            flippedCards.append(index)
        }

        if flippedCards.count == 2 {
            let firstIndex = flippedCards[0]
            let secondIndex = flippedCards[1]

            if cards[firstIndex].emoji == cards[secondIndex].emoji {
                print(">>> Correct!\n")
                
                // ✅ Mark cards as "removed" instead of deleting immediately
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    cards[firstIndex].isMatched = true  // ✅ Mark cards as matched
                    cards[secondIndex].isMatched = true
                    flippedCards.removeAll()
                }
            } else {
                // ❌ Cards do not match → Flip back after delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    cards[firstIndex].isFlipped.toggle()
                    cards[secondIndex].isFlipped.toggle()
                    flippedCards.removeAll()
                }
            }
        }
    }
    
    func resetGame() {
        let allEmojis = ["💀", "🐶", "🐱", "🐭", "🐸", "🦊", "🐯", "🐷", "🐹", "🐰"]
        let selectedEmojis = allEmojis.prefix(numberOfPairs) // ✅ Get the right number of pairs

        cards = selectedEmojis.flatMap { [Card(emoji: $0), Card(emoji: $0)] }.shuffled() // ✅ Generate card pairs and shuffle


        // ✅ Reset card states
        for i in cards.indices {
            cards[i].isFlipped = false
            cards[i].isMatched = false
        }

        // ✅ Clear flipped cards tracking
        flippedCards.removeAll()
    }

}

#Preview {
    ContentView()
}

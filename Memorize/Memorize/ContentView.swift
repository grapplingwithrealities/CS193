//
//  ContentView.swift
//  Memorize
//
//  Created by Tony Pearo on 11/10/22.
//

import SwiftUI

struct ContentView: View {
    // Signifying that viewModel can change and we want it to update
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View{

        // view builder
        // bag of legos
        // Can add other modifiers to zstack inside of ()
        ScrollView{
            // # of grid items determines number of items in a row
            // adaptive allows for an automated fit for # of items
            // minimum changes the min size of the grid item
            // 85 fits 16 on vert/hor display
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
                ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                // Ask viewModel to express user intent
                                viewModel.choose(card)
                            }
                }
            }
        }
        .foregroundColor(.red)
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
    }
}

struct CardView: View{
    let card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            // const
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                // Default is filled
                // Stroke is just the outline of the shape
                // cornerRadius uses a label
                shape.fill().foregroundColor(.white)
                // stroke does outside border and strokeBorder does inside border
                shape.strokeBorder(lineWidth: 3)
                // Can type modifiers here or use selector on rhs of xcode
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else{
                shape.fill()
            }
        }
    }
}





















// Glue code
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}

//
//  Theme.swift
//  Memorize
//
//  Created by Tony Pearo on 11/29/22.
//

import Foundation
import SwiftUI

// Req Task 3: Add a theme to model
struct Theme<chosenTheme> {
    struct CardTheme {
        var name: String
        var emojis: [String]
        var numberOfPairsOfCards: Int
        var themeColor: Color
    }
}

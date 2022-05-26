//
//  EmojiRatingView.swift
//  literal
//
//  Created by diayan siat on 19/04/2022.
//

import SwiftUI

struct EmojiRatingView: View {
    @Binding var rating: Int //binding property that will be accessible everywhere in the app

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill().foregroundColor(.green)
                .frame(width: 36, height: 36)
            switch rating {
            case 1:
                Text("😴")
            case 2:
                Text("😔")
            case 3:
                Text("🙂")
            case 4:
                Text("😊")
            default:
                Text("🤩")
            }
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: .constant(4))
    }
}

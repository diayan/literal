//
//  BookItemView.swift
//  literal
//
//  Created by diayan siat on 23/05/2022.
//

import SwiftUI

struct BookItemView: View {
    @ObservedObject var bookViewModel: BookViewModel

    var body: some View {
        bookViewModel.book.image
            .resizable()
            .aspectRatio(3/2, contentMode: .fit)
            .cornerRadius(10)
            .overlay(TextOverlay(bookViewModel: bookViewModel))
            .padding()
    }
}

struct TextOverlay: View {
    @ObservedObject var bookViewModel: BookViewModel
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(bookViewModel.book.title ?? "Unknown")
                    .font(.title)
                    .bold()
                Text(bookViewModel.book.author ?? "Unknown author")
            }
            .padding()
        }
        .cornerRadius(10)
        .foregroundColor(.white)
    }
}

struct BookItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookItemView(bookViewModel: BookViewModel.newBook())
    }
}

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
        
        ZStack {
            RoundedRectangle(cornerRadius: 8)
            .fill().foregroundColor(.white)
            //.cornerRadius(20, corners: [.topLeft, .bottomRight])
            VStack(alignment: .leading) {
                ZStack {
                    bookViewModel.book.image
                        .renderingMode(.original)
                        .resizable()
                        .cornerRadius(8, corners: [[.topLeft, .topRight]])
                        .frame(height: 140)
                    VStack {
                        HStack {
                            Spacer()
                            EmojiRatingView(rating: .constant(bookViewModel.book.rating!))
                        }
                        Spacer()
                    }.padding(8)
                    
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(bookViewModel.book.title ?? "Unknown")
                            .bold()
                            .foregroundColor(.black)
                        
                        Text(bookViewModel.book.author ?? "Unknown author")
                            .foregroundColor(Color.secondary)
                    }.padding(.leading, 8)
                    
                    Spacer()
                    
                    ZStack {
                    RoundedRectangle(cornerRadius: 12)
                            .fill().foregroundColor(.green)
                            .frame(width: 84, height: 24)
                    Text("In Progress")
                        .foregroundColor(Color.white)
                        .font(.caption)
                    }.padding(.trailing, 8)
                }.padding(.bottom)

            }
           
        }.padding(.bottom, 16)
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

//
//  AddBookView.swift
//  literal
//
//  Created by diayan siat on 19/04/2022.
//

import SwiftUI

struct AddBookView: View {
    //the form will need all these data locally
    @State private var title  = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre  = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller", "Tragedy"]

    var body: some View {
        //NavigationView {
            Form {
                Section(header: Text("Book Info")) {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
//                    Picker("Rating", selection: $rating) {
//                        ForEach(0..<6) {
//                            Text(String($0))
//                        }
//                    }
                } header: {
                     Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        //add the book
                        var newBook = Book()
                        newBook.title = title
                        newBook.author = author
                        newBook.genre = genre
                        newBook.review = review
                        newBook.rating = rating
                        
                    }
                }
          //  }.navigationTitle("Add Book")
            }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

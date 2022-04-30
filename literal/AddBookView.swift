//
//  AddBookView.swift
//  literal
//
//  Created by diayan siat on 19/04/2022.
//

import SwiftUI

struct AddBookView: View {
    //environment variable to manage data that is loaded at the start of the app in LiteralApp
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss //use to dismiss presented view
    
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
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.genre = genre
                        newBook.review = review
                        newBook.rating = Int16(rating)
                        
                        try? moc.save()
                        dismiss() //dismiss view after saving data
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

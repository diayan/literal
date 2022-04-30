//
//  ContentView.swift
//  literal
//
//  Created by diayan siat on 19/04/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc //get managed context
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title), //sort alphabetically by title of book
        SortDescriptor(\.author) //second sort just incase title is not enough to sort
    ]) var books: FetchedResults<Book> //fetch all books that saved in core data
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        BookDetailView(book: book)
                    } label: {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown title")
                                .font(.headline)
                            
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteBook(at:))
            }
            .navigationTitle("Literal")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
                
            }.sheet(isPresented: $showingAddScreen) {
                
                NavigationView {
                    AddBookView()
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Dismiss", action: {
                                    showingAddScreen = false
                                })
                            }
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Add", action: {
    //
    //        //                        The properties of newScrumData are bound to the controls of
    //        //                        EditView and have the current info that the user set. The
    //        //                        scrums array contains elements of DailyScrum, so you’ll need
    //        //                        to create a new DailyScrum to insert into the array.
    //                                let newScrum = DailyScrum(title: newScrumData.title, attendees: newScrumData.attendees, lengthInMinutes: Int(newScrumData.lengthInMinutes), color: newScrumData.color)
    //
    //        //                        The scrums array is a binding, so updating the array in this
    //        //                        view updates the source of truth contained in the app.
    //                                scrums.append(newScrum)
                                    showingAddScreen = false
                                })
                            }
                        }
                }.background(.purple)
            }
        }
    }
    
    func deleteBook(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

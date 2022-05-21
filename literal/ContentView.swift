//
//  ContentView.swift
//  literal
//
//  Created by diayan siat on 19/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var search = ""
    @State private var showingAddScreen = false
    @ObservedObject var bookListViewModel = BookListViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            HomeGridItemView()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            HomeGridItemView()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                        HStack(spacing: 16) {
                            HomeGridItemView()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            HomeGridItemView()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }.listRowBackground(Color.listBGColor)
                    .padding(.leading, -20)
                    .padding(.trailing, -20)
                
                Section(header: Text("My Books")
                            .foregroundColor(Color.primary)
                            .fontWeight(.bold)
                            .textCase(.none)
                ) {
                    ForEach(bookListViewModel.bookViewModels) { bookViewModel in
                        NavigationLink {
                            BookDetailView(bookViewModel: bookViewModel)
                        } label: {
                            BookView(bookViewModel: bookViewModel)
                        }
                    }
                    .onDelete(perform: deleteBook(at:))
                }
            }
            .navigationTitle("Literal")
            .searchable(text: $search)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("New Book")
                        }
                    }
                }
            }
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
            //let book = books[offset]
            //books.remove(at: offset)
        }
    }
}

struct BookView: View {
    @ObservedObject var bookViewModel: BookViewModel
    
    var body: some View {
        EmojiRatingView(rating: bookViewModel.book.rating!)
            .id(bookViewModel.id)
            .font(.largeTitle)
        
        VStack(alignment: .leading) {
            Text(bookViewModel.book.title ?? "Unknown title")
                .id(bookViewModel.id)
                .font(.headline)
            
            Text(bookViewModel.book.author ?? "Unknown Author")
                .id(bookViewModel.id)
                .foregroundColor(.secondary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

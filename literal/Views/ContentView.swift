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
            ScrollView(.vertical, showsIndicators: false) {
//                Section {
                VStack {
                    
                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            NavigationLink(destination: AddBookView()) {
                            HomeGridItemView()
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
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
                    .padding(.bottom)
//                }.listRowBackground(Color.listBGColor)
//                    .padding(.leading, -20)
//                    .padding(.trailing, -20)
//
//                Section(header: Text("My Books")
//                            .foregroundColor(Color.primary)
//                            .fontWeight(.bold)
//                            .textCase(.none)
//                ) {
                    
                    HStack {
                        Section() {
                            Text("My Books")
                                .foregroundColor(Color.primary)
                                .fontWeight(.bold)
                                .textCase(.none)
                        }
                        Spacer()
                        
                    }
                    ForEach(bookListViewModel.bookViewModels) { bookViewModel in
                        NavigationLink(destination: BookDetailView(bookViewModel: bookViewModel)) {
                            BookItemView(bookViewModel: bookViewModel)
                        }
                    }
                    .onDelete { indexSet in
                        bookListViewModel.removeBook(atOffsets: indexSet)
                    }
//                }
                }
                .padding()
                    
            }
            .background(Color.listBGColor)
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
        EmojiRatingView(rating:.constant(bookViewModel.book.rating!))
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

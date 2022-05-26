//
//  ContentView.swift
//  literal
//
//  Created by diayan siat on 19/04/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var search = ""
    @State private var showingAddScreen = false
    @ObservedObject var bookListViewModel = BookListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                CategoryRowView(bookListViewModel: bookListViewModel)
                    .padding(.leading)
                    .padding(.trailing)
                
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
                        Label("Add Book", systemImage: "person.crop.circle")
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
}


struct HomeViewView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

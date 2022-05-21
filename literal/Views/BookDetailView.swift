//
//  BookDetailView.swift
//  literal
//
//  Created by diayan siat on 19/04/2022.
//

import SwiftUI

struct BookDetailView: View {
    @ObservedObject var bookViewModel: BookViewModel
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss //use to dismiss presented view
    @State private var showDeleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(bookViewModel.book.genre ?? "Fantasy")
                    .resizable()
                    .scaleEffect()
                
                Text(bookViewModel.book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(bookViewModel.book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(bookViewModel.book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(bookViewModel.book.rating!))
                .font(.largeTitle)
        }
        .navigationTitle(bookViewModel.book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete book?", isPresented: $showDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure?")
        }
        .toolbar{
            Button {
                showDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook() {
        dismiss() //dismiss detail view after deleting the book
    }
}

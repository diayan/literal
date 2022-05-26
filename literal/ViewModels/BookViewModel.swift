//
//  BookViewModel.swift
//  literal
//
//  Created by diayan siat on 21/05/2022.
//

import Foundation
import Combine
import UIKit

class BookViewModel: ObservableObject, Identifiable {
    @Published var book: Book
    
    var id: String = ""
    @Published var completionStateIconName = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    static func newBook() -> BookViewModel {
        BookViewModel(book: Book(
            title: "Treasure Island",
            rating: 5,
            genre: "Romance",
            review: "Great book",
            author: "Louis Stevenson",
            completed: true,
            dateStarted: "ddate",
            dateCompleted: "date",
            imageName: "Mystery",
            category: .horror
        ))
    }
    
    init(book: Book) {
        self.book = book
        
        $book
            .map{ $0.completed! ? "checkmark.circle.fill" : "circle"}
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellables)
        
        $book
            .map{$0.id}
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}

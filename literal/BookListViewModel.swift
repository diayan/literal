//
//  BookListViewModel.swift
//  literal
//
//  Created by diayan siat on 21/05/2022.
//

import Foundation
import Combine
import UIKit

class BookListViewModel: ObservableObject {
    @Published var bookViewModel = [BookViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.bookViewModel = books.map { book in
            BookViewModel(book: book)
        }
    }
    
    func removeBook(atOffsets indexSet: IndexSet) {
        bookViewModel.remove(atOffsets: indexSet)
    }
    
    func addBook(book: Book) {
        bookViewModel.append(BookViewModel(book: book))
    }
}

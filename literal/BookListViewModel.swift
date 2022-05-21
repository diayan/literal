//
//  BookListViewModel.swift
//  literal
//
//  Created by diayan siat on 21/05/2022.
//

import Foundation
import Combine
import UIKit

/* ObservableObject allows us bind the object to swiftui elements and makes sure ui
  react to any changes to the view's models */
class BookListViewModel: ObservableObject {
    @Published var bookViewModels = [BookViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.bookViewModels = books.map { book in
            BookViewModel(book: book)
        }
    }
    
    func removeBook(atOffsets indexSet: IndexSet) {
        bookViewModels.remove(atOffsets: indexSet)
    }
    
    func addBook(book: Book) {
        bookViewModels.append(BookViewModel(book: book))
    }
}

//
//  Book.swift
//  literal
//
//  Created by diayan siat on 21/05/2022.
//

import Foundation


struct Book: Identifiable {
    var id: String = UUID().uuidString
    var title: String?
    var rating: Int?
    var genre: String?
    var review: String?
    var author: String?
    var completed: Bool?
    var dateStarted: String?
    var dateCompleted: String?
}

#if DEBUG
let books = [
    Book(title: "Treasure Island", rating: 4, genre: "Adventure", review: "Fantastic Book", author: "Louis Stevenson", completed: true, dateStarted: "02/03/2022", dateCompleted: "Today"),
    Book(title: "Things Fall Apart", rating: 4, genre: "Adventure", review: "Fantastic Book", author: "Chinua Achebe", completed: true, dateStarted: "02/03/2022", dateCompleted: "Today"),
    Book(title: "Oliver Twist", rating: 4, genre: "Adventure", review: "Fantastic Book", author: "Charles Dickens", completed: true, dateStarted: "02/03/2022", dateCompleted: "Today")
]
#endif

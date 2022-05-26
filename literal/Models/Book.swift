//
//  Book.swift
//  literal
//
//  Created by diayan siat on 21/05/2022.
//

import Foundation
import SwiftUI


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
    var imageName: String?
                
    var image: Image {
        Image(imageName ?? "")
    }
}

#if DEBUG
let books = [
    Book(
        title: "Treasure Island",
        rating: 4,
        genre: "Fantasy",
        review: "Fantastic Book",
        author: "Louis Stevenson",
        completed: true,
        dateStarted: "02/03/2022",
        dateCompleted: "Today",
        imageName: "Mystery"
    ),
    
    Book(
        title: "Things Fall Apart",
        rating: 5,
        genre: "Horror",
        review: "Fantastic Book",
        author: "Chinua Achebe",
        completed: true,
        dateStarted: "02/03/2022",
        dateCompleted: "Today",
        imageName: "Horror"
    ),
    
    Book(
        title: "Oliver Twist",
        rating: 2,
        genre: "Mystery",
        review: "Fantastic Book",
        author: "Charles Dickens",
        completed: true,
        dateStarted: "02/03/2022",
        dateCompleted: "Today",
        imageName: "Thriller"
    )
]
#endif

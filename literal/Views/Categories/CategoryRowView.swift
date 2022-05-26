//
//  CategoryRowView.swift
//  literal
//
//  Created by diayan siat on 26/05/2022.
//

import SwiftUI

struct CategoryRowView: View {
    @ObservedObject var bookListViewModel = BookListViewModel()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 8) {
                ForEach(bookListViewModel.bookViewModels) { book in
                    CategoryItemView(bookViewModel: book)
                }
            }
        }
        .frame( height: 40)
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView()
    }
}

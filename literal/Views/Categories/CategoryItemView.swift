//
//  CategoryItemView.swift
//  literal
//
//  Created by diayan siat on 26/05/2022.
//

import SwiftUI

struct CategoryItemView: View {
    @ObservedObject var bookViewModel: BookViewModel

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill().foregroundColor(.red)
                .frame(width: 120, height: 36)
            HStack {
                Text("💀")
                    .font(.title)
                Text(bookViewModel.book.category?.rawValue ?? "")
                    .foregroundColor(.white)
            }
        }
    }
}

//struct CategoryItemView_Previews: PreviewProvider {
//    static var previews: some View {
//       // CategoryItemView().previewLayout(.sizeThatFits)
//    }
//}

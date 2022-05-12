//
//  HomeGridItemView.swift
//  literal
//
//  Created by diayan siat on 07/05/2022.
//

import SwiftUI

struct HomeGridItemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "book.closed.circle")
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                Spacer()
                Text("2")
                    .font(.title.bold())
                    .foregroundColor(Color.accentColor)
            }
            .padding(.bottom, 4)
            Text("Today")
                .font(.headline)
                .foregroundColor(.gray)
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
        .padding(.leading)
        .padding(.trailing)
        .clipShape(Capsule())
    }
}

struct HomeGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeGridItemView()
            .previewLayout(.sizeThatFits)
    }
}

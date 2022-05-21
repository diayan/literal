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
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.pink)
                    .font(.title)
                Spacer()
                Text("0")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
            }
            .padding(.bottom, 4)
            Text("Today")
                .font(.headline)
                .foregroundColor(.gray)
        }
        .padding(8)
    }
}

struct HomeGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeGridItemView()
            .previewLayout(.sizeThatFits)
    }
}

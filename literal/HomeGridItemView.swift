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
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
            }
            .padding(.top)
            .padding(.bottom)
            Text("Today")
                .font(.headline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.primary)
        .cornerRadius(10)
        .frame(width: 160, height: 120)
    }
}

struct HomeGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeGridItemView()
            .previewLayout(.sizeThatFits)
    }
}

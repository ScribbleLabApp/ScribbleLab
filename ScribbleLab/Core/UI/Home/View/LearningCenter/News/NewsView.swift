//
//  NewsView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 27.01.24.
//

import SwiftUI

struct NewsView: View {
    @State private var searchText = ""
    var body: some View {
        ScrollView {
//            List {
                ForEach(0 ... 10, id: \.self) { news in
                    NewsCell(
                        title: "Lorem ipsum dolor sit amet",
                        date: "27. January 2024",
                        description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren."
                    ) {
                        NewsDetail()
                    }
                }
//            }
            .navigationTitle("News")
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
        .searchable(text: $searchText)
        .tint(.orange)
    }
}

#Preview {
    NavigationStack {
        NewsView()
    }
}

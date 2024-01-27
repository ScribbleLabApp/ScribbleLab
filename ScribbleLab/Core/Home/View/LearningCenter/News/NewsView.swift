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
                    HStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 160, height: 85)
                        
                        VStack(alignment: .leading) {
                            Text("Lorem ipsum dolor sit amet")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .tint(.primary)
                            
                            Text("27. January 2024")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            
                            Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren.")
                            
                            Divider()
                        }
                    }
                    .padding(.horizontal)
                }
//            }
            .navigationTitle("News")
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    NavigationStack {
        NewsView()
    }
}

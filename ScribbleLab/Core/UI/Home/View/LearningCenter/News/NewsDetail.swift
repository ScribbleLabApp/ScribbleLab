//
//  NewsDetail.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 28.01.24.
//

import SwiftUI
import Social

struct NewsDetail: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("NEWS AND UPDATES")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.darkOrange)
                    
                    Text("28. January 2024")
                        .foregroundStyle(.secondary)
                        .font(.caption)
                        .padding(.vertical, 5)
                }
                
                VStack(alignment: .leading) {
                    Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    
                    Text("""
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. dolor in hendrerit in vulputate velit esse molestie consequat.

Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet,
""")
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 12)
                    
                    Button("Find out more") {
                        
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "bookmark")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
        .padding()
        .tint(.orange)
    }
}

#Preview {
    NavigationStack {
        NewsDetail()
    }
}

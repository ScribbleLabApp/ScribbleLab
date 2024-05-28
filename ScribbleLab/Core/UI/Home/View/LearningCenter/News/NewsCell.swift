//
//  NewsCell.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 28.01.24.
//

import SwiftUI

struct NewsCell<Content: View>: View {
    var title: String
    var date: String
    var description: String
    var destination: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: destination()) {
                HStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 160, height: 85)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .tint(.primary)
                        
                        Text(date)
                            .font(.subheadline)
                            .tint(.secondary)
                        
                        Text(description)
                            .multilineTextAlignment(.leading)
                            .tint(.primary)
                        
                        Divider()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

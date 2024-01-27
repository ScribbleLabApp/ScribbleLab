//
//  LerningCell.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 27.01.24.
//

import SwiftUI

struct LearningCell: View {
    @Environment(\.openURL) var openURL
    /*
    @State private var isWebViewPresented = false
    @State private var showToolbar = false
    */
    
    var image: Image?
    var title: String
    var description: String
    var url: String
    
    var body: some View {
        Button {
            if let url = URL(string: url) {
                openURL(url)
            }
//            isWebViewPresented.toggle()
        } label: {
            VStack(alignment: .leading, spacing: 15) {
                if let image = image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250, height: 150)
                        .cornerRadius(15)
                } else {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 250, height: 150)
                        .foregroundStyle(.darkOrange)
                }
                
                Text(title)
                    .font(.headline)
                    .tint(.primary)
                
                Text(description)
                    .multilineTextAlignment(.leading)
                    .tint(.secondary)
            }
            .frame(width: 250, height: 300)
        }
        /*
        .sheet(isPresented: $isWebViewPresented) {
            SLWebView(url: url, showToolbar: $showToolbar)
        }
         */
    }
}

#Preview {
    LearningCell(title: "Learn ScribbleLab on iPad", description: "Learn how to take efficient notes with ScribbleLab on your iPad with our online article.", url: "https://github.com/")
}

//
//  NewsView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 27.01.24.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        ScrollView {
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    NewsView()
}

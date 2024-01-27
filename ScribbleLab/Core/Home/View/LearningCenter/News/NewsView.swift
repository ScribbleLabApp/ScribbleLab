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
                    .frame(width: 100, height: 70)
            }
        }
    }
}

#Preview {
    NewsView()
}

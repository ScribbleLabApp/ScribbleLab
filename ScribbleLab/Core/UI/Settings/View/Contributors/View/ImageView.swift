//
//  ImageView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject private var imageViewModel: ImageViewModel
    
    init(urlString: String?) {
            imageViewModel = ImageViewModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: imageViewModel.image ?? UIImage())
            .resizable()
            .clipShape(Circle())
            .frame(width: 60, height: 60)
    }
}

#Preview {
    ImageView(urlString: "https://avatars.githubusercontent.com/u/129311622?v=4")
}

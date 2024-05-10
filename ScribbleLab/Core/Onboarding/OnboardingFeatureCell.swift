//
//  OnboardingFeatureCell.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 09.05.24.
//

import SwiftUI

struct OnboardingFeatureCell: View {
    var data: FeatureCell
    
    var body: some View {
        VStack {
            Image(data.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
                .padding(.vertical, 20)
            
            VStack(spacing: 25) {
                Text(data.title)
                    .font(.title)
                    .bold()
                
                Text(data.description)
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .padding(.vertical, 5)
                    .padding(.bottom, 10)
            }
        }
        .padding(5)
    }
}

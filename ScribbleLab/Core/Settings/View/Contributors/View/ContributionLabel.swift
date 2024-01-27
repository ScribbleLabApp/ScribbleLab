//
//  ContributionLabel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 24.01.24.
//

import SwiftUI

struct ContributionLabel: View {
    var contribution: ContributionLabelSpecies
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            Text(contribution.string)
                .font(.footnote)
                .foregroundStyle(.white)
                .bold()
            
            RoundedRectangle(cornerRadius: 15)
                .frame(width: width, height: height)
                .foregroundStyle(contribution.labelColor.opacity(0.4))
        }
    }
}

#Preview {
    ContributionLabel(contribution: .bugFix, width: 90, height: 30)
}

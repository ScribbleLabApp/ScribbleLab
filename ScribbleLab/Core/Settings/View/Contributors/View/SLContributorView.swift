//
//  SLContributorView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI

struct SLContributorView: View {
    @Environment(\.openURL) var openURL
    @State private var openGitHubLink = false
    
    var body: some View {
            Form {
                Section {
                    ForEach(SLContributorModel.allCases) { contributors in
                        Button {
                            openURL(URL(string: contributors.githubURL)!)
                        } label: {
                            // FIXME: Load images from Github
                            HStack {
                                Image(systemName: "person.circle.fill")
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(contributors.name)
                                            .fontWeight(.semibold)
                                    }
                                }
                                
                                Spacer()
                                
                                ContributionLabel(contribution: contributors.section, width: 120, height: 30)
                            }
                        }
                    }
                } header: {
                    Text("Contributors")
                } footer: {
                    Text("We're appriciate all of your contributions and bug fixes you've done in order to achive this powerful app")
                }
            }
            .navigationTitle("Contributors")
            .navigationBarTitleDisplayMode(.inline)
            .tint(.orange)
    }
}

#Preview {
    NavigationStack {
        SLContributorView()
    }
}

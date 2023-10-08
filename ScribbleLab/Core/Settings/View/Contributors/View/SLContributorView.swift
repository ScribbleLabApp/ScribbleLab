//
//  SLContributorView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import SwiftUI

struct SLContributorView: View {
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    ForEach(SLContributorModel.allCases) { contributors in
                        HStack {
                            // FIXME: Load images from Github
//                            Image(contributors.urlStringAdress)
                            Image(systemName: "person.circle.fill")
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(contributors.name)
                                        .fontWeight(.semibold)
                                    Text(contributors.land)
                                }
                                Text(contributors.section)
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
        }
    }
}

#Preview {
    SLContributorView()
}

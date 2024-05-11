//
//  OnboardingView.swift
//  ScribbleLab
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp. All rights reserved
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  Authors:
//  - NH: https://github.com/N3v1

import SwiftUI
import ScribbleCoreServices

struct OnboardingView: View {
    let features: [FeatureCell]
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                TabView {
                    ForEach(features, id: \.id) { feature in
                        OnboardingFeatureCell(data: feature)
                            .tag(feature.id)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                
                Spacer()
                
                VStack {
                    NavigationLink {
                        SignUpView()
                            .preferredColorScheme(.light)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Get Started")
                            .padding()
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .background {
                                Color.orange
                                    .frame(width: 360, height: 44)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                    }
                    .padding(.bottom)
                    
                    Text("By continuing, you confirm that you have read, understand, and\n agree to our [Privacy Policy](https://github.com/ScribbleLabApp) and [Terms and Conditions](https://github.com/ScribbleLabApp).")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .padding(.bottom, 10)
                }
                .padding(.vertical, 5)
                
                Spacer()
            }
        }
        .tint(.orange)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleFeatures: [FeatureCell] = [
            FeatureCell(imageName: "person-illustartion-orange", title: "Improve your note-taking Experience", description: "Experience seamless digital note-taking with our intuitive features\n designed to enhance your productivity and organization", id: 1001),
            FeatureCell(imageName: "sample-image-2", title: "Manage Everything Digitally", description: "Say goodbye to clutter and chaos as you transition to a streamlined digital workspace,\n making it easier than ever to manage your tasks and documents.", id: 1002),
            FeatureCell(imageName: "sample-image-3", title: "Improve Your Grades", description: "Achieve academic excellence with our specialized tools and resources,\n tailored to help you improve your grades and overall performance\n in your studies.", id: 1003)
        ]
        
        return OnboardingView(features: sampleFeatures)
    }
}

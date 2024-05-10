//
//  OnboardingView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 09.05.24.
//

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

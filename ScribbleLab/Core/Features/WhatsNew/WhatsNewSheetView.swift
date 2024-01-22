//
//  WhatsNewSheetView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 14.01.24.
//

import SwiftUI

struct WhatsNewSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    let features: [OnboardingFeature]
    
    var appName: String {
        Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String ?? "No App name found"
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            // FIXME: USE APP ICON INSTEAD
            Image(uiImage: UIImage(named: "Documentation")!)
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("What's new in \(appName)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Grid(horizontalSpacing: 16, verticalSpacing: 16) {
                // Cloud
                ForEach(features) { feature in
                    GridRow {
                        Image(systemName: feature.systemImage)
                            .font(.title)
                            .foregroundStyle(Color.accentColor)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(feature.title)
                                .font(.headline)
                            
                            Text(feature.description)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
            
//            Button("Continue") {
//                dismiss()
//            }
//            .buttonStyle(.borderedProminent)
//            .modifier(IGButtonModifier())
            
            SLButtonView(text: "Continue", font: .headline, backgroundColor: .accentColor, textColor: .white, cornerRadius: 12, action: {
                dismiss()
            })
            .padding()
        }
    }
}

struct WhatsNewSheetView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
            .sheet(isPresented: .constant(true)) {
                WhatsNewSheetView(features: [
                    .init(systemImage: "cloud", title: "Your notes, anytime, everywhere", description: "Create docs on your iPhone, iPad, Mac or visionPro and iCloud will sync them across all your devices."),
                    .init(systemImage: "person.icloud", title: "Collaborate together", description: "Collaborate in real-time with others on the same document. See live updates, edits, and comments as your team works together seamlessly."),
                    .init(systemImage: "pencil.and.scribble", title: "Your Best Note-Taking Experience", description: "Unleash your creativity with an enhanced note-taking experience. Craft documents effortlessly on your iPhone, iPad, Mac, or VisionPro, elevating your productivity and making note-taking a seamless and enjoyable process.")
                ])
                    .preferredColorScheme(.dark)
            }
    }
}

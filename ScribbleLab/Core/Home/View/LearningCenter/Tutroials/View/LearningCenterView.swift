//
//  LearningCenterView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 27.01.24.
//

import SwiftUI

struct LearningCenterView: View {
    var body: some View {
        ScrollView {
            
            // GET STARTED
            VStack(alignment: .leading) {
                // HEAD
                HStack {
                    Text("Get Started with ScribbleLab")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button("See all") {}
                }
                
                // CELL
                ScrollView {
                    HStack {
                        LearningCell(image: nil, title: "Learn ScribbleLab on iPad", description: "Learn how to take the most out of ScribbleLab on your iPad with our online articles.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                        
                        LearningCell(image: nil, title: "Learn ScribbleLab on mac", description: "Learn how to take the most out of ScribbleLab on your mac with our online articles.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                    }
                }
                
            }
            
            // TUTORIALS
            VStack(alignment: .leading) {
                // HEAD
                HStack {
                    Text("Tutorials")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button("See all") {}
                }
                
                // CELL
                ScrollView {
                    HStack {
                        LearningCell(image: nil, title: "Lorem impsum", description: "Lorem impsum dolor sit amet consecutoer avec impsum dolor amet.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                        
                        LearningCell(image: nil, title: "Lorem impsum", description: "Lorem impsum dolor sit amet consecutoer avec impsum dolor amet.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                        
                        LearningCell(image: nil, title: "Lorem impsum", description: "Lorem impsum dolor sit amet consecutoer avec impsum dolor amet.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                    }
                }
                
            }
            
            // SCRIBBLE USER GUIDE
            VStack(alignment: .leading) {
                // HEAD
                HStack {
                    Text("ScribbleLab User Guide")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button("See all") {}
                }
                
                // CELL
                ScrollView {
                    HStack {
                        LearningCell(image: nil, title: "ScribbleLab Shortcuts", description: "Intuitive keyboard shortcuts to speed your and your teams workflow.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                        LearningCell(image: nil, title: "Libaries", description: "Learn more about Unsplash, icons and other free and exclusive external libaries.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                    }
                }
            }
            
            // QUICK TIPS
            VStack(alignment: .leading) {
                // HEAD
                HStack {
                    Text("Quick Tips")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button("See all") {}
                }
                
                // CELL
                ScrollView {
                    HStack {
                        LearningCell(image: nil, title: "Lorem impsum", description: "Lorem impsum dolor sit amet consecutoer avec impsum dolor amet.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                        
                        LearningCell(image: nil, title: "Lorem impsum", description: "Lorem impsum dolor sit amet consecutoer avec impsum dolor amet.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                        
                        LearningCell(image: nil, title: "Lorem impsum", description: "Lorem impsum dolor sit amet consecutoer avec impsum dolor amet.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                    }
                }
                
            }
            
            // WHATS NEW
            VStack(alignment: .leading) {
                // HEAD
                HStack {
                    Text("What's New")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button("See all") {}
                }
                
                // CELL
                ScrollView {
                    HStack {
                        LearningCell(image: nil, title: "Lorem impsum", description: "Lorem impsum dolor sit amet consecutoer avec impsum dolor amet.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                        
                        LearningCell(image: nil, title: "Lorem impsum", description: "Lorem impsum dolor sit amet consecutoer avec impsum dolor amet.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                        
                        LearningCell(image: nil, title: "Lorem impsum", description: "Lorem impsum dolor sit amet consecutoer avec impsum dolor amet.", url: "https://github.com/ScribbleLabApp/ScribbleLab")
                    }
                }
            }
            
            .navigationTitle("Tutorials")
        }
        .padding()
        .tint(.orange)
    }
}

#Preview {
    LearningCenterView()
}

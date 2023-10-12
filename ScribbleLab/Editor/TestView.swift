//
//  TestView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 11.10.23.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    print("Return to home screen")
                } label: {
                    ZStack {
                        Color.white
                            .frame(width: 60, height: 60)
                            .cornerRadius(15)
                            .shadow(radius: 15)
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                ZStack {
                    Color.white
                        .frame(width: 630, height: 60)
                        .cornerRadius(15)
                        .shadow(radius: 15)
                    HStack {
                        // MARK: - pencil
                        /// If the pencil icon is clicked a "popup/ second toolbar" will apper above the toolbar to choose between diffrent pens
                        Image(systemName: "pencil")
                            .padding()
                        
//                        // MARK: pen
                        Image(systemName: "applepencil.gen1")
                            .padding()
                        
                        // MARK: textmarker
                        Image(systemName: "highlighter")
                            .padding()
                        
                        // MARK: rubber
                        Image(systemName: "eraser")
                            .padding()
                        
                        // MARK: - ruler
                        Image(systemName: "ruler")
                            .padding()
                        
                        // MARK: - text
                        Image(systemName: "textformat")
                            .padding()
                        
                        // MARK: - Scan documents
                        Image(systemName: "doc.viewfinder")
                            .padding()
                        
                        Image(systemName: "photo")
                            .padding()
                        
                        // MARK: Voice record
                        Image(systemName: "mic")
                            .padding()
                        
                        Divider()
                            .frame(width: 10, height: 50)
                        
                        // currently used item
                        Image(systemName: "hand.point.up.left.fill")
                            .padding()
                    }
                    .foregroundStyle(.black)
                }
                
                Spacer()
                
                ZStack {
                    Color.white
                        .frame(width: 250, height: 60)
                        .cornerRadius(15)
                        .shadow(radius: 15)
                    
                    HStack {
                        Image(systemName: "arrow.counterclockwise")
                            .padding()
                        
                        Image(systemName: "arrow.clockwise")
                            .foregroundStyle(.gray)
                            .padding()
                        
                        Image(systemName: "ellipsis.circle")
                            .padding()
                        
                        Image(systemName: "book.pages")
                            .padding()
                    }
                }
                .padding(.horizontal, 30)
            }
            .padding(.vertical, 20)
            Spacer()
        }
    }
}

#Preview {
    TestView()
}

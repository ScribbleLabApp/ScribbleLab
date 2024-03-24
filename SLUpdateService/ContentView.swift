//
//  ContentView.swift
//  SLUpdateService
//
//  Created by Nevio Hirani on 23.03.24.
//

import SwiftUI

struct ContentView: View {
    
    let updateText = [
        "Why did the software developer go broke? Because he used up all his cache!",
        "How do software developers stay cool in the summer? They use fans.",
        "Why was the computer cold? It left its Windows open.",
        "What do you call a software developer from Finland? Nerdic.",
        "Why do programmers always mix up Christmas and Halloween? Because Oct 31 == Dec 25.",
        "What did the software developer do during lunchtime? He had a byte.",
        "Why did the software developer go broke? Because he lost his domain in a poker game!",
        "Why did the software developer always carry a pencil and paper? In case he had to draw a flowchart.",
        "Why do Java developers wear glasses? Because they don't see sharp!",
        "How do you comfort a JavaScript bug? You console it!"
    ]
    
    @State private var randomIndex: Int

    init() {
        self.randomIndex = Int.random(in: 0..<updateText.count)
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

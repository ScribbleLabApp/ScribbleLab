//
//  PerformanceView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.11.23.
//

import SwiftUI
import FirebasePerformance

struct PerformanceView: View {
    @State private var title: String = "Hello, World!"
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                configure()
            }
    }
    
    private func configure() {
        let trace = Performance.startTrace(name: "performance_view_loading")
        trace?.setValue(title, forAttribute: "title_text")
        
        Task { 
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            trace?.setValue("Start downloading", forAttribute: "func_state")
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            trace?.setValue("Countinued downloading", forAttribute: "func_state")
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            trace?.setValue("Finished downloading", forAttribute: "func_state")
            trace?.stop()
        }
    }
}

#Preview {
    PerformanceView()
}

//
//  PerformanceView.swift
//  ScribbleLab
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp.
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

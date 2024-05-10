//
//  ContentView.swift
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

import Firebase
import FirebaseCrashlytics

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @State private var features: [FeatureCell] = onbordingItems

    var body: some View {
        Group {
            if viewModel.userSession == nil { 
                // FIXME: Old: $viewModel.userSession
                OnboardingView(features: features)
//                SignUpView()
//                    .preferredColorScheme(.light)
                    .sheet(isPresented: $viewModel.showCrashReportSheet) {
                        CrashReportSheet()
                    }
                #if os(macOS)
                    .frame(width: 500, height: 400)
                #endif
            } else if viewModel.userSession != nil {
            // FIXME: else if let currentUser = viewModel.currentUser
                SLSideBarView()
                    .sheet(isPresented: $viewModel.showCrashReportSheet) {
                        CrashReportSheet()
                    }
                #if os(macOS)
                    .frame(width: 500, height: 400)
                #endif
            }
        }
        .onAppear {
            if Crashlytics.crashlytics().didCrashDuringPreviousExecution() {
                viewModel.showCrashReportSheet = true
            }
        }
    }
}

#Preview {
    ContentView()
}

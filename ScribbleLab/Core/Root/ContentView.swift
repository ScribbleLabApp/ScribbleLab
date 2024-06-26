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
import ScribbleCoreServices

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @State private var features: [FeatureCell] = onbordingItems
    
    @ObservedObject var crashAgent = SCSCrashExceptionAgent.shared

    var body: some View {
        Group {
            if viewModel.userSession == nil {
                OnboardingView(features: features)
                    .sheet(isPresented: $crashAgent.isUncaughtExceptionRecorded) {
                        CrashReportSheet()
                    }
            } else if viewModel.userSession != nil {
                SLSideBarView()
                    .sheet(isPresented: $crashAgent.isUncaughtExceptionRecorded) { // $viewModel.showCrashReportSheet
                        CrashReportSheet()
                    }
            }
        }
//        .onAppear {
//            if Crashlytics.crashlytics().didCrashDuringPreviousExecution() {
//                viewModel.showCrashReportSheet = true
//            }
//        }
    }
}

#Preview {
    ContentView()
}

//
//  WaitView.swift
//  ScribbleLabAuth/Core
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

struct WaitView: View {
    @State private var bottomSheetIsShown = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                ProgressView()
                    .scaleEffect(2)
                    .padding(.vertical, 12)
                
                VStack(spacing: 3) {
                    Text("Setting up your ScribbleLabApp account")
                    Text("It could take some time..")
                        .foregroundStyle(.secondary)
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Image(systemName: "lock.square.stack.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text("Your ScribbleLab Account information is used to enable services when you sign in, including other features like live collaboration, ... [**See how your data is managed...**](https://github.com/ScribbleLabApp/ScribbleLab)")
                }
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding(.horizontal, 100)
                .onTapGesture {
                    bottomSheetIsShown.toggle()
                }
                .sheet(isPresented: $bottomSheetIsShown) {
                    WaitSheetView()
                }
            }
            .padding()
        }
    }
}

#Preview {
    WaitView()
}

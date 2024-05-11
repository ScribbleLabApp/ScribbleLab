//
//  NotificationOnboardingView.swift
//  ScribbleLab
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp. All rights reserved
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
//  Authors:
//  - NH: https://github.com/N3v1

import SwiftUI
import ScribbleCoreServices

struct NotificationOnboardingView: View {
    @State private var isNotificationGranted: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 10) {
                HStack(spacing: 2) {
                    Text("Stay in the Know:")
                        .foregroundStyle(LinearGradient(colors: [.darkOrange, .orange, .yellow], startPoint: .leading, endPoint: .trailing))
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    Text(" Enable Notifications")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                }
                
                Text("Stay in the loop! Enable Notifications to receive updates on changes made by\n collaborators or catch other important messages. Customize your preferences in\n **Settings > Notifications** to tailor your notification experience to your liking.")
                    .multilineTextAlignment(.center)
            }
            .padding(.vertical, 5)
            
            NotificationOnboardingCellView()
                .frame(width: .infinity, height: 390)
            
            Spacer()
            
            VStack(spacing: 20) {
                SLButtonView(text: isNotificationGranted ? "Next" : "Enable Notifications", font: .subheadline, backgroundColor: .orange, textColor: .white, cornerRadius: 15) {
                    isNotificationGranted.toggle()
                }
                
                Button("Another time") {
                    
                }
                .fontWeight(.semibold)
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            .padding(.vertical, 5)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NotificationOnboardingView()
}

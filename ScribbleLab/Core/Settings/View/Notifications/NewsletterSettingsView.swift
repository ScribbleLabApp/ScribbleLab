//
//  NewsletterSettingsView.swift
//  ScribbleLabCore iOS Lab
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

struct NewsletterSettingsView: View {
    @State var newsletterNotificationsAllowed: Bool = false
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle(isOn: $newsletterNotificationsAllowed) {
                        Text("Allow newsletter-notifications")
                    }
                    if newsletterNotificationsAllowed == true {
                        Button("Register for the newsletter") {
                            // TODO: Newsletter sign up process
                        }
                    }
                } footer: {
                    if newsletterNotificationsAllowed == true {
                        Text("When you sign-up for our newsletter you agree to our Terms Of Use. You'll get weekly/monthly tips on the usage of ScribbleLab. You can unsubscribe everytime.")
                    } else {
                        
                    }
                }
                
                Section {
                    Button {
                        print("DEBUG: Manage subscription")
                    } label: {
                        Text("Manage subscription")
                    }
                    
                    Button {
                        print("DEBUG: Unsubscribe from Newsletter")
                    } label: {
                        Text("Unsubscribe")
                            .foregroundStyle(.red)
                    }
                } header: {
                    Text("Newsletter-Settings")
                }
            }
            .navigationTitle("Newsletter-Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Manage") {
                        print("DEBUG: Manage subscription")
                    }
                }
            }
        }
    }
}

#Preview {
    NewsletterSettingsView()
}

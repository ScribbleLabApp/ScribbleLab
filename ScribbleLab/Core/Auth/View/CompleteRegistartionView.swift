//
//  CompleteRegistartionView.swift
//  ScribbleLabAuth
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

struct CompleteRegistartionView: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @EnvironmentObject var vm: LoginViewModel
    
    @State private var isTaskCompleted = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    @State private var onboardingIsShown = false
       
    var body: some View {
        VStack (spacing: 12) {
            
            Spacer()
            
            Image(.documentation)
                .resizable()
                .frame(width: 150, height: 150)
            
            Text("Welcome to ScribbleLab, \(viewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("Click below to complete registration and start using ScribbleLab")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            SLButton(text: "Register", font: .subheadline, backgroundColor: .orange, textColor: .black, cornerRadius: 10) {
                
                defer {
                    onboardingIsShown.toggle()
                }
                
                Task {
                    try await viewModel.createUser()
                    try await vm.signIn()
                }
            }
            .padding(.vertical)
            .sheet(isPresented: $onboardingIsShown){
                NavigationStack {
                    VStack {
                        NotificationOnboardingView()
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                dismiss()
                                onboardingIsShown.toggle()
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .tint(.secondary)
                            }
                        }
                    }
                }
            }
            
            Spacer()
        }
//        .alert(isPresented: $showAlert, content: {
//                Alert(
//                    title: Text("An unknown error occurred!"),
//                    message: Text(alertMessage),
//                    dismissButton: .default(Text("OK"))
//            )
//        })
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
//        if isTaskCompleted {
//            WaitView()
//        }
    }
}

#Preview {
    NavigationStack {
        CompleteRegistartionView()
            .environmentObject(RegistrationViewModel())
        .environmentObject(LoginViewModel())
    }
}

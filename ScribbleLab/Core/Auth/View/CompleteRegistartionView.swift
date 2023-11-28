//
//  CompleteRegistartionView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.10.23.
//

import SwiftUI

struct CompleteRegistartionView: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @EnvironmentObject var vm: LoginViewModel
    
    @State private var isTaskCompleted = false
    @State private var showAlert = false
    @State private var alertMessage = ""
       
    var body: some View {
        VStack (spacing: 12){
            
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
                Task { try await viewModel.createUser() }
                Task { try await vm.signIn() }
//                Task {
//                    do {
//                        try await viewModel.createUser()
//                        // Task completed successfully
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
//                            isTaskCompleted = true // Display the view after 30 seconds
//                        }
//                    } catch {
//                        alertMessage = error.localizedDescription
//                        showAlert.toggle()
//                    }
//                }
            }
            .padding(.vertical)
            
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
    CompleteRegistartionView()
        .environmentObject(RegistrationViewModel())
        .environmentObject(LoginViewModel())
}

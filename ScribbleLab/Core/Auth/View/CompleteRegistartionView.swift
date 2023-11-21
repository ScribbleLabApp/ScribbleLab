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
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    CompleteRegistartionView()
        .environmentObject(RegistrationViewModel())
}

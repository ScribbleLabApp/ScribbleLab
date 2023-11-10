//
//  WaitSheetView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.11.23.
//

import SwiftUI

struct WaitSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "lock.fill")
                    .resizable()
                    .scaledToFill().frame(width: 60, height: 60)
                    .padding(.vertical, 20)
                
                Text("ScribbleLab - Auth & Privacy")
                    .font(.largeTitle).bold()
                    .padding(.vertical, 10)
                
                Text("ScribbleLab and ScribbleLabAuth (SLA) is a secure, reliable and easy-to-use authentication service that allows users to gain access to the application's resources through a simple and straightforward process. The ScribbleLab Auth Service is built on top of Firebase, a powerful and scalable database service, ensuring that user authentication is done in a secure and robust manner. \n ")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                VStack {
                    Text("""
                             • When you create an account some of your information may be visible to other users: username, profile image. You can set up who can see your information.
                             
                             •
                             """)
                }
                .padding(10)
                
                Spacer()
            }
            .frame(width: 500, height: 800)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
//                        Image(systemName: "xmark.circle.fill")
//                            .tint(.gray)
                        Text("Done").bold()
                            .tint(.orange)
                    }
                }
            }
        }
    }
}

#Preview {
    WaitSheetView()
}

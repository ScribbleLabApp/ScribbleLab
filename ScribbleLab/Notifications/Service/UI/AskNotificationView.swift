//
//  AskNotificationView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.02.24.
//

import SwiftUI

struct AskNotificationView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: -5) {
                Image("notification-iPad")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500)
                
                Image(.memoji)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 550)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            
            Text("Don't miss out on what your \nfriends are up to")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.vertical, 5)
            
            Text("Never miss those precious moments.")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            
            VStack(spacing: 25) {
                Button {
                    // TODO: PermissionKit ~> ask NotificationPermission
                    print("DEBUG: Ask for NotificationPermission")
                } label: {
                    Text("Turn on notifications")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .tint(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background {
                            Capsule()
                                .foregroundStyle(.orange)
                        }
                }
                
                
                Button {
                    dismiss()
                } label: {
                    Text("Another time")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .tint(.secondary)
                }
            }
            .padding(.vertical, 30)
            .padding(.horizontal, 10)
            
            Spacer()
        }
    }
}

#Preview {
    Text("Hi")
        .sheet(isPresented: .constant(true)) {
            AskNotificationView()
        }
}

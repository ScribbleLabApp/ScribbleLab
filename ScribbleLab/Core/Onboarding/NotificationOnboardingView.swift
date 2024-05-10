//
//  NotificationOnboardingView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.05.24.
//

import SwiftUI

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

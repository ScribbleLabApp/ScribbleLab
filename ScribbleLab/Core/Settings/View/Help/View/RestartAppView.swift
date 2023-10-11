//
//  RestartAppView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 11.10.23.
//

import Darwin
import SwiftUI
import UserNotifications
import UserNotificationsUI

struct RestartAppView: View {
    @State private var showConfirm = false

    var body: some View {
        VStack {
            Button(action: {
                self.showConfirm = true
            }) {
                Text("Restart Application")
                    .foregroundStyle(.red)
                    .fontWeight(.semibold)
            }
        }.alert(isPresented: $showConfirm, content: { confirmChange })
    }

    var confirmChange: Alert {
        Alert(title: Text("Enable Security mode?"), message: Text("This application needs to restart to update the configuration.\n\nDo you want to restart the application?"),
              primaryButton: .default (Text("Yes")) {
                restartApplication()
            },
              secondaryButton: .cancel(Text("No"))
        )
    }

    func restartApplication(){
        var localUserInfo: [AnyHashable : Any] = [:]
        localUserInfo["pushType"] = "restart"
        
        let content = UNMutableNotificationContent()
        content.title = "Configuration Update Complete"
        content.body = "Tap to reopen the application"
        content.sound = UNNotificationSound.default
        content.userInfo = localUserInfo
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)

        let identifier = "com.nhstudio.ScribbleLab" // "com.domain.restart"
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
    
        center.add(request)
        exit(0)
    }
}

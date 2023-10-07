//
//  NotificationSheetView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI

struct NotificationSheetView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView("You have no unread notifications", systemImage: "bell.badge.fill")
                .navigationTitle("Notifications")
        }
    }
}

#Preview {
    NotificationSheetView()
}

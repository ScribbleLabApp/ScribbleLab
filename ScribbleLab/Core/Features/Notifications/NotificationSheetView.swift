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
            ScrollView {
                // swiftlint:disable unused_closure_parameter
                ForEach(0...10, id: \.self) { _ in
                    NotificationCell()
                }
                // swiftlint:enable unused_closure_parameter
            }
            .padding()
            .navigationTitle("Notifications")
        }
    }
}

#Preview {
    NotificationSheetView()
}

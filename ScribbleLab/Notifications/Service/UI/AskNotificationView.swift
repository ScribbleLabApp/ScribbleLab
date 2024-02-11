//
//  AskNotificationView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.02.24.
//

import SwiftUI

struct AskNotificationView: View {
    var body: some View {
        VStack {
            Image(.notification)
                .ignoresSafeArea()
            
            Image(.memoji)
        }
    }
}

#Preview {
    AskNotificationView()
}

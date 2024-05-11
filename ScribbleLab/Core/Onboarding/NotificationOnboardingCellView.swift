//
//  NotificationOnboardingCellView.swift
//  ScribbleLab
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp.
//  Copyright (c) 2024 Morris Richman (Mcrich23) - All rights reserved.
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
//  Authors:
//  - Mcrich: https://github.com/Mcrich23
//  - NH: https://github.com/N3v1

import SwiftUI
import ScribbleCoreServices

// swiftlint:disable identifier_name
struct NotificationOnboardingCellView: View {
    enum Notification: CaseIterable {
        case message, collaboration_request, permission
        
        var id: Int {
            switch self {
            case .message:
                0
            case .collaboration_request:
                1
            case .permission:
                2
            }
        }
        
        var reverseId: Int {
            switch self {
            case .message:
                2
            case .collaboration_request:
                1
            case .permission:
                0
            }
        }
        
        var title: String {
            switch self {
            case .message:
                ""
            case .collaboration_request:
                "Collaboration Request"
            case .permission:
                "Allow notifications"
            }
        }
        
        var subtitle: String {
            switch self {
            case .message:
                "+3 new comments from Olivia"
            case .collaboration_request:
                "Olivia invited you to collaborate on 'Globalization Essay'."
            case .permission:
                "'ScribbleLab' would like to send notifications."
            }
        }
        
        var time: String {
            switch self {
            case .message:
                ""
            case .collaboration_request:
                "5m ago"
            case .permission:
                "Now"
            }
        }
    }
    
    @State var notificationScales: [Notification : CGFloat] = [:]
    @State var startingNotificationPositions: [Notification : CGFloat] = [:]
    
    func handleScroll(_ y: CGFloat) {
        let divideFactor: CGFloat = 140
        var notifications: [Notification] {
            if y > 0 {
                Notification.allCases.reversed()
            } else {
                Notification.allCases
            }
        }
        
        for notification in notifications {
            var id: Int { // FIXME: switch `notification.reverseId` with notification.id
                if notifications == Notification.allCases.reversed() {
                    notification.reverseId
                } else {
                    notification.id
                }
            }
            let subtractFactor = CGFloat(106*id)
            
            var scaleFactor: CGFloat {
                if y > 0 {
                    (1-(y-subtractFactor)/divideFactor)
                } else {
                    (1+(y+subtractFactor)/divideFactor)
                }
            }
            if scaleFactor <= 1 && scaleFactor >= 0 && ((y < 0 && y+subtractFactor < 0) || (y > 0 && y+subtractFactor > 0)) {
                self.notificationScales[notification] = scaleFactor
            }
        }
    }
    let userInterfaceIdiom = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                Spacer()
                
                VStack(spacing: 12) {
                    Spacer()
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 6) {
                            ForEach(Notification.allCases, id: \.self) { notification in
                                NotificationAlertView(
                                    title: notification.title,
                                    subtitle: notification.subtitle,
                                    time: notification.time)
                                .frame(width: userInterfaceIdiom == .phone ? geo.size.width : geo.size.width/2)
                                    .rotationEffect(.degrees(180))
                                    .scaleEffect(notificationScales[notification] ?? 1)
                                    .frame(height: 100)
                            }
                        }
                        .background(
                            GeometryReader { proxy in
                                Color.clear
                                    .preference(key: ScrollOffsetPreferenceKey.self, value: proxy.frame(in: .named("scroll")).origin)
                                    .onAppear {
                                        startingNotificationPositions[.permission] = proxy.frame(in: .global).minY
                                    }
                            }
                        )
                        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                            if value.y > 0 {
                                handleScroll(value.y)
                            } else {
                                handleScroll(value.y)
                            }
                        }
                    }
                    .coordinateSpace(name: "scroll")
                    .rotationEffect(.degrees(180))
                    .frame(maxHeight: CGFloat(Notification.allCases.count*106))
                    
                    Spacer()
                }
                
                Spacer()
                
            }            
        }
        .padding()
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) { }
}

struct NotificationAlertView: View {
    let title: String
    let subtitle: String
    let time: String
    let userInterfaceIdiom = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        HStack {
            Image(.documentation)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
            VStack {
                HStack {
                    Text("Time Sensitive")
                        .textCase(.uppercase)
//                        .foregroundStyle(Color.secondary)
                        .foregroundColor(.clear)
                        .bold()
                        .font(.subheadline)
                    Spacer()
                    Text(time)
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                }
                HStack {
                    Text(title)
                        .bold()
                        .font(.headline)
                    Spacer()
                }
                HStack {
                    Text(subtitle)
                    Spacer()
                }
            }
        }
        .frame(maxWidth: 500)
        .padding()
        .padding(.trailing, 3)
        .background(Color(uiColor: .secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    NotificationOnboardingCellView()
}
// swiftlint:enable identifier_name

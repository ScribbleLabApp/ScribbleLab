//
//  SLTip.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 03.12.23.
//

import SwiftUI
import Foundation
import TipKit

// swiftlint:disable empty_count
struct CreateNewDocumentTip: Tip {
    static let launchHomeScreenEvent = Event(id: "launchHomeScreen")
    static let createNewDocumentEvent = Event(id: "createNewocument")
    
    var title: Text {
        Text("Create New Document")
    }
    
    var message: Text? {
        Text("To create a new document tab here")
    }
    
    var image: Image? {
        Image(systemName: "doc.badge.plus")
    }
    
    var rules: [Rule] {
        #Rule(Self.createNewDocumentEvent) { event in
            event.donations.count == 0
        }
        
        #Rule(Self.launchHomeScreenEvent) { event in
            event.donations.count < 7
        }
    }
}

struct ShowNotificationsTip: Tip {    
    static let visitNotificationViewEvent = Event(id: "visitNotificationView")
    static let launchHomeScreenEvent = Event(id: "launchHomeScreen")
    
    var title: Text {
        Text("Show Notifications")
    }
    
    var message: Text? {
        Text("Tab on the 􀝖 to check your notifications")
    }
    
    var actions: [Action] {
        [
            Tip.Action(
                id: "notification-settings",
                title: "Configure Notifications",
                perform: {
                    
                }
            )
        ]
    }
    
    var rules: [Rule] {
        #Rule(Self.visitNotificationViewEvent) { event in
            event.donations.count == 0
        }
        
        #Rule(Self.launchHomeScreenEvent) { event in
            event.donations.count > 7
        }
    }
}
// swiftlint:enable empty_count

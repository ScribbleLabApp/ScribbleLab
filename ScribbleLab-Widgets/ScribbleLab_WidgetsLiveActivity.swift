//
//  ScribbleLab_WidgetsLiveActivity.swift
//  ScribbleLab-Widgets
//
//  Created by Nevio Hirani on 09.10.23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ScribbleLab_WidgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ScribbleLab_WidgetsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ScribbleLab_WidgetsAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ScribbleLab_WidgetsAttributes {
    fileprivate static var preview: ScribbleLab_WidgetsAttributes {
        ScribbleLab_WidgetsAttributes(name: "World")
    }
}

extension ScribbleLab_WidgetsAttributes.ContentState {
    fileprivate static var smiley: ScribbleLab_WidgetsAttributes.ContentState {
        ScribbleLab_WidgetsAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ScribbleLab_WidgetsAttributes.ContentState {
         ScribbleLab_WidgetsAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ScribbleLab_WidgetsAttributes.preview) {
   ScribbleLab_WidgetsLiveActivity()
} contentStates: {
    ScribbleLab_WidgetsAttributes.ContentState.smiley
    ScribbleLab_WidgetsAttributes.ContentState.starEyes
}

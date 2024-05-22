//
//  HelloWidgetLiveActivity.swift
//  HelloWidget
//
//  Created by Enbo Chen on 22.5.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct HelloWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct HelloWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: HelloWidgetAttributes.self) { context in
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

extension HelloWidgetAttributes {
    fileprivate static var preview: HelloWidgetAttributes {
        HelloWidgetAttributes(name: "World")
    }
}

extension HelloWidgetAttributes.ContentState {
    fileprivate static var smiley: HelloWidgetAttributes.ContentState {
        HelloWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: HelloWidgetAttributes.ContentState {
         HelloWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: HelloWidgetAttributes.preview) {
   HelloWidgetLiveActivity()
} contentStates: {
    HelloWidgetAttributes.ContentState.smiley
    HelloWidgetAttributes.ContentState.starEyes
}

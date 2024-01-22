//
//  SLHelpView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.10.23.
//

import SwiftUI
import Darwin
import UserNotifications

// swiftlint:disable force_unwrapping
// swiftlint:disable line_length
struct SLHelpView: View {
    @Environment(\.openURL) var openURL
    @State private var securityModeIsEnabled = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/issues/new?assignees=&labels=bug&projects=&template=bug_report.yml&title=%F0%9F%94%B4+%3Cbug+name%3E")!)
                    } label: {
                        Label("Report a bug",systemImage: "ladybug")
                    }
//                    .tint(.orange)
                    
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/issues/new?assignees=&labels=crash&projects=&template=crash_report.yml&title=%F0%9F%A7%A8+%3Ccrash+report%3E")!)
                    } label: {
                        Label("Report a crash", systemImage: "laptopcomputer.trianglebadge.exclamationmark")
                    }
//                    .tint(.orange)
                    
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/issues/new?assignees=&labels=translation%2C+good-first-issue%2C+bug&projects=&template=translation_issue.yml&title=%F0%9F%8C%8E+Translation+Issue+in+%3CScreen%3E")!)
                    } label: {
                        Label("Report a translation issue", systemImage: "character.bubble.ja")
                    }
//                    .tint(.orange)
                } header: {
                    Text("Report a bug")
                } footer: {
                    Text("To report a bug please follow our issue template.")
                }
                
                Section {
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/discussions/categories/q-a")!)
                    } label: {
                        Label("Ask a question", systemImage: "questionmark.bubble")
                    }
//                    .tint(.orange)
                    
                    Button {
                        
                    } label: {
                        Label("Join our Discord Community", systemImage: "server.rack")
                    }
//                    .tint(.orange)
                    
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/discussions/categories/q-a")!)
                    } label: {
                        Label("Q&A", systemImage: "bubble.left.and.text.bubble.right.rtl")
                    }
//                    .tint(.orange)
                    
                    Button {
                        
                    } label: {
                        Label("Documentation", systemImage: "book.and.wrench")
                    }
//                    .tint(.orange)
                    
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab")!)
                    } label: {
                        Label("Guide", systemImage: "character.book.closed")
                    }
//                    .tint(.orange)
                } header: {
                    Text("Help")
                } footer: {
                    Text("")
                }
                
                Section {
                    NavigationLink {
                        SLTroubleshootingView()
                    } label: {
                        Label("Troubleshooting", systemImage: "exclamationmark.triangle")
                    }
                }
                
                Section {
                    Toggle(isOn: $securityModeIsEnabled) {
                        Text("Enable Security mode (BETA)")
                    }
                    if securityModeIsEnabled == true {
                        RestartAppView()
                    }
                    
                } header: {
                    Text("Security mode")
                } footer: {
                    Text("When Safe Mode is enabled, ScribbleLab starts with several features disabled to ensure maximum stability or detect errors. This process requires a restart.")
                }
            }
            .tint(.orange)
            .navigationTitle("Help")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
// swiftlint:enable force_unwrapping
// swiftlint:enable line_length

#Preview {
    SLHelpView()
}

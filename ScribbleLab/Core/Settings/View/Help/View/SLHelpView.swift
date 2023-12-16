//
//  SLHelpView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.10.23.
//

import SwiftUI
import Darwin
import UserNotifications

struct SLHelpView: View {
    @Environment(\.openURL) var openURL
    @State private var securityModeIsEnabled = false
    
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/issues/new?assignees=&labels=bug&projects=&template=bug_report.yml&title=%F0%9F%94%B4+%3Cbug+name%3E")!)
                    } label: {
                        Label("Report a bug",systemImage: "ladybug")
                    }
                    .tint(.black)
                    
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/issues/new?assignees=&labels=crash&projects=&template=crash_report.yml&title=%F0%9F%A7%A8+%3Ccrash+report%3E")!)
                    } label: {
                        Label("Report a crash", systemImage: "laptopcomputer.trianglebadge.exclamationmark")
                    }
                    .tint(.black)
                    
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/issues/new?assignees=&labels=translation%2C+good-first-issue%2C+bug&projects=&template=translation_issue.yml&title=%F0%9F%8C%8E+Translation+Issue+in+%3CScreen%3E")!)
                    } label: {
                        Label("Report a translation issue", systemImage: "character.bubble.ja")
                    }
                    .tint(.black)
                } header: {
                    Text("Report a bug")
                } footer: {
                    Text("To report a bug please follow our issue template.")
                }
                
                Section() {
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/discussions/categories/q-a")!)
                    } label: {
                        Label("Ask a question", systemImage: "questionmark.bubble")
                    }
                    .tint(.black)
                    
                    Button {
                        
                    } label: {
                        Label("Join our Discord Community", systemImage: "server.rack")
                    }
                    .tint(.black)
                    
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/discussions/categories/q-a")!)
                    } label: {
                        Label("Q&A", systemImage: "bubble.left.and.text.bubble.right.rtl")
                    }
                    .tint(.black)
                    
                    Button {
                        
                    } label: {
                        Label("Documentation", systemImage: "book.and.wrench")
                    }
                    .tint(.black)
                    
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab")!)
                    } label: {
                        Label("Guide", systemImage: "character.book.closed")
                    }
                    .tint(.black)
                } header: {
                    Text("Help")
                } footer: {
                    Text("")
                }
                
                Section() {
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
            .navigationTitle("Help")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SLHelpView()
}

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
//                    .onTapGesture {
//                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/issues/new?assignees=&labels=bug&projects=&template=bug_report.yml&title=%F0%9F%94%B4+%3Cbug+name%3E")!)
//                    }
                    .tint(.black)
                    Button {
                        
                    } label: {
                        Label("Report a crash", systemImage: "laptopcomputer.trianglebadge.exclamationmark")
                    }
                    .tint(.black)
                    Button {
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/issues/new?assignees=&labels=bug&projects=&template=bug_report.yml&title=%F0%9F%94%B4+%3Cbug+name%3E")!)
                    } label: {
                        Label("Report a translation issue", systemImage: "character.bubble.ja") // bubble.left.and.exclamationmark.bubble.right
                    }
                    .tint(.black)
                } header: {
                    Text("Report a bug")
                } footer: {
                    Text("To report a bug please follow our issue template.")
                }
                
                Section() {
                    Label("Ask a question", systemImage: "questionmark.bubble")
                    Label("Q&A", systemImage: "bubble.left.and.text.bubble.right.rtl")
                    Label("Documentation", systemImage: "book.and.wrench") // books.vertical
                    Button {
                        
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

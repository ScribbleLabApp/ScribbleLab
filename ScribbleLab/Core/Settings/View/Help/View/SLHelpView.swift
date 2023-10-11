//
//  SLHelpView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.10.23.
//

import SwiftUI

struct SLHelpView: View {
    @Environment(\.openURL) var openURL
    
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
                        openURL(URL(string: "https://github.com/ScribbleLabApp/ScribbleLab/issues/new?assignees=&labels=bug&projects=&template=bug_report.yml&title=%F0%9F%94%B4+%3Cbug+name%3E")!)
                    } label: {
                        Label("Report a translation issue", systemImage: "bubble.left.and.exclamationmark.bubble.right")
                    }
                    .tint(.black)
                } header: {
                    Text("Report a bug")
                } footer: {
                    Text("To report a bug please follow our issue template.")
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

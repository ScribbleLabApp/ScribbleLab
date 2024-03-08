//
//  GeneralSettingsView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.03.24.
//

import SwiftUI
import Setting

struct GeneralSettingsView: View {
    var body: some View {
        SettingStack {
            SettingPage(title: "General") {
                SettingGroup {
                    SettingPage(title: "Info") {}
                        .previewIcon("info.bubble", color: .gray)
                    
                    SettingPage(title: "Updates") {}
                        .previewIcon("restart", color: .darkOrange)
                }
                
                SettingGroup {
                    SettingPage(title: "Autocorrection") {}
                        .previewIcon("textformat.abc.dottedunderline", color: .pink)
                    
                    SettingPage(title: "Apple Pencil") {}
                        .previewIcon("applepencil", color: .yellow)
                    
                    SettingPage(title: "Cloud sync") {}
                        .previewIcon("cloud.fill", color: .blue)
                    
                    SettingPage(title: "Collaboration") {}
                        .previewIcon("person.line.dotted.person.fill", color: .teal)
                    
                    SettingPage(title: "Extensions") {}
                        .previewIcon("puzzlepiece.extension.fill", color: .purple)
                    
                    SettingPage(title: "Functions") {}
                        .previewIcon("sparkles", color: .purple)
                    
                    SettingPage(title: "Flags") {}
                        .previewIcon("flag.fill", color: .red)
                }
                
                SettingGroup {
                    SettingPage(title: "Date & Time") {}
                        .previewIcon("calendar", color: .red)
                    
                    SettingPage(title: "Fonts") {}
                        .previewIcon("f.cursive", color: .pink)
                }
                
                SettingGroup {
                    SettingPage(title: "Legal Notice") {}
                        .previewIcon("book.pages", color: .gray)
                }
            }
        }
    }
}

#Preview {
    GeneralSettingsView()
}

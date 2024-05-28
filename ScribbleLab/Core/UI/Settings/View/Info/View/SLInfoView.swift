//
//  SLInfoView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.10.23.
//

import SwiftUI

/// An extension that gets the build and version number of this xcodeproj
/// as a String
extension Bundle {
    public var appName: String { getInfo("CFBundleName") }
    public var displayName: String { getInfo("CFBundleDisplayName") }
    public var language: String { getInfo("CFBundleDevelopmentRegion") }
    public var identifier: String { getInfo("CFBundleIdentifier") }
    public var copyright: String { getInfo("NSHumanReadableCopyright")
        .replacingOccurrences(of: "\\\\n", with: "\n") }
    
    public var appBuild: String { getInfo("CFBundleVersion") }
    public var appVersionLong: String { getInfo("CFBundleShortVersionString") }
    
    fileprivate func getInfo(_ str: String) -> String { infoDictionary?[str] as? String ?? "An error occured" }
}

struct SLInfoView: View {
    let versionNumber = Bundle.main.appVersionLong
    let buildNumber = Bundle.main.appBuild
    let appName = Bundle.main.appName
    let displayName = Bundle.main.displayName
    let language = Bundle.main.language
    let identifier = Bundle.main.identifier
    let copyright = Bundle.main.copyright
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("App name")
                        Spacer()
                        Text(appName)
                            .foregroundStyle(.gray)
                    }
                    // FIXME: Display git sha
                    HStack {
                        Text("Build sha")
                        Spacer()
                        Text("n/a")
                            .foregroundStyle(.gray)
                    }
                    HStack {
                        Text("Build Number")
                        Spacer()
                        Text(buildNumber)
                            .foregroundStyle(.gray)
                    }
                    HStack {
                        Text("Display name")
                        Spacer()
                        Text(displayName)
                            .foregroundStyle(.gray)
                    }
                    HStack {
                        Text("Language")
                        Spacer()
                        Text(language)
                            .foregroundStyle(.gray)
                    }
                    HStack {
                        Text("Identifier")
                        Spacer()
                        Text(identifier)
                            .foregroundStyle(.gray)
                    }
                    HStack {
                        Text("Version Number")
                        Spacer()
                        Text(versionNumber)
                            .foregroundStyle(.gray)
                    }
                    HStack {
                        Text("Copyright")
                        Spacer()
                        Text("© 2023 - 2024 ScribbleLabApp. All rights reserved.")
                            .foregroundStyle(.gray)
                    }
                } header: {
                    Text("General infos")
                } footer: {
                    Text("Those informations are needed if you want to report an issue")
                }
                
                Section {
                    NavigationLink {
                        PackageLicense()
                    } label: {
                        Text("License")
                    }
                } header: {
                    Text("Licenses")
                } footer: {
                    Text("")
                }
            }
                .navigationTitle("Info")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SLInfoView()
}

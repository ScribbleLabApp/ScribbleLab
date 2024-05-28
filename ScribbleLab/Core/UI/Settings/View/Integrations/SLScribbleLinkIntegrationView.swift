//
//  SLScribbleLinkIntegrationView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.01.24.
//

import SwiftUI

struct SLScribbleLinkIntegrationView: View {
    @State var scribbleLinkEnabled: Bool = true
    @State var documentSyncWScribbleLink: Bool = true
    @State var shareDocumentMetadataSLInk: Bool = true
    @State var shareSubscription: Bool = true
    
    @State var downloaded: Bool = false
    @State var showAppStore: Bool = false
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $scribbleLinkEnabled) {
                    Text("ScribbleLink")
                }
            }
            
            Section {
                Toggle(isOn: $documentSyncWScribbleLink) {
                    Text("Allow document syncing")
                }
                Toggle(isOn: $shareDocumentMetadataSLInk) {
                    Text("Share document metadata")
                }
                Toggle(isOn: $shareSubscription) {
                    Text("Share subscription")
                }
            } header: {
                Text("ScribbleLink Integrations Settings")
            }
            
            Section {
                HStack {
                    Image(.documentation)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 85, height: 85)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 1) {
                            Image(.appstore)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            
                            Text("App Store")
                                .foregroundStyle(.secondary)
                                .font(.footnote)
                        }
                        .padding(-3.5)
                        
                        Text("ScribbleLink")
                            .bold()
                        Text("Managing your school day made easy")
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Button {
                            if downloaded == true {
                                print("DEBUG: HELPER -> Open ScrribbleLink")
                            } else {
                                print("DEBUG: HELPER -> Open AppStore")
                            }
                        } label: {
                            Text(downloaded ? "Open" : "Download")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .padding(7.5)
                                .background {
                                    Capsule()
                                        .foregroundStyle(Color.orange)
                                        .frame(width: 80, height: 30)
                                }
                                .foregroundStyle(.white)
                        }
                        .padding(.vertical, 2)
                        .onTapGesture {
                            showAppStore = true
                        }
                        .sheet(isPresented: $showAppStore) {
                            //                                StoreView(appID: "1444383602")
                            Text("Show AppStore: ScribbleLink")
                        }
                        
                        Text(downloaded ? "" : "In App-Purchases")
                            .font(.system(size: 7))
                            .foregroundStyle(.secondary)
                    }
                }
            }
            
            Section {
                Button("Rescan status for ScribbleLink") {
                    print("DEBUG: HELPER -> Check /user/Applications/app://ScribbleLink")
                }
            } footer: {
                Text("When you rescan the status of ScribbleLink, you allow us to search for ScribbleLink in your Application folder.")
            }
            
            Section {
                HStack {
                    Text("Version")
                    
                    Spacer()
                    
                    Text("1.0.0-alpha")
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("Build")
                    
                    Spacer()
                    
                    Text("1")
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("Status")
                    
                    Spacer()
                    
                    Text("available")
                        .foregroundStyle(.secondary)
                }
            } header: {
                Text("ScribbleLink Core")
            }
        }
        .navigationTitle("ScribbleLink")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SLScribbleLinkIntegrationView()
}

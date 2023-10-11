//
//  PackageLicense.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 11.10.23.
//

import SwiftUI

struct PackageLicense: View {
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    NavigationLink {
                        
                    } label: {
                        Text("AppAuth")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("GoogleSignIn")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("GoogleSignInSwift")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("GTMAppAuth")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("GTMSessionFetcher")
                    }
                } header: {
                    Text("Licenses")
                } footer: {
                    Text("While agreeing to our LICENSE you automatically agree to the LICENSES of our used Dependencies")
                }
            }
                .navigationTitle("License")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PackageLicense()
}

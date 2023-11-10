//
//  WaitView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 31.10.23.
//

import SwiftUI

struct WaitView: View {
    @State private var bottomSheetIsShown = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                ProgressView()
                    .scaleEffect(2)
                    .padding(.vertical, 12)
                
                VStack(spacing: 3) {
                    Text("Setting up your ScribbleLabApp account")
                    Text("It could take some time..")
                        .foregroundStyle(.secondary)
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Image(systemName: "lock.square.stack.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text("Your ScribbleLab Account information is used to enable services when you sign in, including other features like live collaboration, ... [**See how your data is managed...**](https://github.com/ScribbleLabApp/ScribbleLab)")
                }
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding(.horizontal, 100)
                .onTapGesture {
                    bottomSheetIsShown.toggle()
                }
                .sheet(isPresented: $bottomSheetIsShown) {
                    WaitSheetView()
                }
            }
            .padding()
        }
    }
}

#Preview {
    WaitView()
}

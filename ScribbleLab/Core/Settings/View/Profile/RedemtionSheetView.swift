//
//  RedemtionSheetView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 11.10.23.
//

import SwiftUI

struct RedemtionSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var giftCode = ""
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // MARK: top
                VStack {
                    Image(.documentation)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 128, height: 128)
                        .shadow(radius: 8)
                    Text("Redeem a gift Code")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding()
                
                TextField("Enter a valid gift code", text: $giftCode)
                    .modifier(IGTextFieldModifier())
                    .frame(width: 410, height: 100)
                
                Button {
                    
                } label: {
                    Text("Redeem")
                        .modifier(IGButtonModifier())
                }
                
                // MARK: Available gift codes
                // FIXME: Remove the grayish background of the list
                List {
                    Section() {
                        Text("FREE10")
                        Text("BIRTHDAY01")
                    } header: {
                        Text("Unlimeted")
                    } footer: {
                        Text("Tab on a gift code to redeem it")
                    }
                }
                .frame(width: UIScreen.main.bounds.width / 2, height: 170)
                .padding()
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .tint(.gray)
                    }
                }
            }
            .navigationTitle("Redeemtion")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RedemtionSheetView()
}

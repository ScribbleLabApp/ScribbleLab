//
//  CrashReportSheet.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 23.01.24.
//

import SwiftUI
import FirebaseCrashlytics

struct CrashReportSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var crashDescription: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(.documentation)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 128, height: 128)
                Text("ScribbleLab Crash Report")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("""
    It seems like you've experienced a crash.
    Do you like to share some details of your crash to help
    use to improve ScribbleLab?
    """)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                
                // Larger TEXTFIELD for description
                TextEditor(text: $crashDescription)
                    .frame(width: 500, height: 200)
                    .cornerRadius(12)
                    .border(Color.gray)
                    .padding()
                
                SLButtonView(text: "Send Analytics & Crash Report", font: .subheadline, backgroundColor: .orange, textColor: .white, cornerRadius: 12) {
                    let customError = CustomError(description: crashDescription)
                    Crashlytics.crashlytics().record(error: customError)
                    dismiss()
                }
                
                Spacer()
                
                Button("Ignore and dismiss Crash report") {
                    dismiss()
                }
                .tint(.orange)
                .padding(.vertical, 30)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
            .tint(.orange)
        }
    }
}

struct CustomError: Error {
    let description: String
}

#Preview {
    Text("Hi")
        .sheet(isPresented: .constant(true), content: {
            CrashReportSheet()
        })
}

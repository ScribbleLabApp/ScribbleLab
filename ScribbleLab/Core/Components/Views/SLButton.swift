//
//  SLButton.swift
//  ScribbleLabCore
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import SwiftUI

/// A customizable button view.
///
/// This view creates a styled button with customizable appearance and action.
///
/// Example Usage:
/// ```swift
/// SLButton(text: String, 
/// font: Font,
/// backgroundColor: Color,
/// textColor: Color,
/// cornerRadius: CGFloat,
/// action: @escaping () -> Void)
/// ```
struct SLButtonView: View {
    var text: String
    var font: Font
    var backgroundColor: Color
    var textColor: Color
    var cornerRadius: CGFloat
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(text)
                .font(font) // .subheadline
                .fontWeight(.semibold)
                .foregroundColor(textColor) // .black
                .frame(width: 360, height: 44)
                .background(backgroundColor)
                .cornerRadius(cornerRadius) // 10
                // MARK: -  Stroke of the Button (if backgroundColor = .clear):
                .background {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color(red: 248/255, green: 248/255, blue: 248/255))
                        .strokeBorder(Color(red: 194/255, green: 194/255, blue: 194/255), lineWidth: 0.5)
                }
        }
    }
}

extension View {
    /// Creates a styled button with customizable appearance and action.
    ///
    /// Use this function to create a button with specific text, font, colors, corner radius, and an associated action.
    ///
    /// - Parameters:
    ///   - text: The text to display on the button.
    ///   - font: The font to apply to the button text.
    ///   - color: The background color of the button.
    ///   - textColor: The color of the button's text.
    ///   - cornerRadius: The corner radius of the button.
    ///   - action: The action to perform when the button is tapped.
    ///
    /// - Returns: A view representing the styled button.
    /// 
    func SLButton(text: String, font: Font, backgroundColor: Color, textColor: Color, cornerRadius: CGFloat, action: @escaping () -> Void) -> some View {
        SLButtonView(text: text, font: font, backgroundColor: backgroundColor, textColor: textColor, cornerRadius: cornerRadius, action: action)
    }
}

// MARK: - SLButton Test View
/// A test view for the `SLButton`'s
///
/// Use this view to test the SLButtonView functionality.
/// This view provides examples of using the `SLButton` with different configurations.
///
struct SLButtonTestView: View {
    var body: some View {
        VStack {
            Text("This is a View to test the SLButton!")
            
            SLButton(text: "Tab on me", font: .subheadline, backgroundColor: .orange, textColor: .black, cornerRadius: 10) {
                print("Button was pressed!")
            }
            SLButton(text: "Tab on me", font: .subheadline, backgroundColor: .clear, textColor: .black, cornerRadius: 10) {
                print("Button was pressed!")
            }
        }
    }
}

#Preview {
    SLButtonTestView()
}

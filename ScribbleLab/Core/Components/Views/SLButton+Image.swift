//
//  SLButton+Image.swift
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

/// A customizable button view that supports displaying either a custom image or a system image along with text.
///
/// Example Usage:
/// ```swift
/// SLButton_Image(
///     text: "Button Text",
///     font: .headline,
///     textColor: .white,
///     backgroundColor: .blue,
///     cornerRadius: 8,
///     action: { print("Button tapped") },
///     image: Image("customImage"),
///     imageWidth: 35,
///     imageHeight: 35
/// )
/// ```
///
/// - Parameters:
///   - text: The text to display on the button.
///   - font: The font to apply to the button text.
///   - backgroundColor: The background color of the button.
///   - textColor: The color of the button's text.
///   - cornerRadius: The corner radius of the button.
///   - action: The action to perform when the button is tapped.
///   - imageName: The name of the system image to display on the left side.
///   - imageName: The name of the system image to display on the left side.
///   - imageWidth: The width of the image.
///   - imageHeight: The height of the image.
///
/// - Returns: A view representing the styled button with an image on the left side.
///
struct SLButton_Image: View {
    var text: String
    var font: Font
    var textColor: Color
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var action: () -> Void
    
    var image: Image?
    var systemImageName: String?
    
    var imageWidth: CGFloat // 35 for Auth
    var imageHeight: CGFloat // 35 for Auth


    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                if let image = image {
                    image
                        .resizable()
                        .frame(width: imageWidth, height: imageHeight)
//                        .padding()
                } else if let systemImageName = systemImageName {
                    Image(systemName: systemImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: imageWidth, height: imageHeight)
//                        .padding()
                }
                
//                Spacer()
                
                Text(text)
                    .font(font) // .subheadline
                    .fontWeight(.semibold)
                    .foregroundColor(textColor) // .black
                
//                Spacer()
            }
                .frame(width: 360, height: 44)
                .background(backgroundColor)
                .cornerRadius(cornerRadius) // 10
            
                // MARK: -  Stroke of the Button (if backgroundColor = .clear):
                .background {
                    RoundedRectangle(cornerRadius: 13)
                        .fill(Color(red: 248/255, green: 248/255, blue: 248/255))
                        .strokeBorder(Color(red: 194/255, green: 194/255, blue: 194/255), lineWidth: 0.5)
                }
            
        }
    }
}

extension View {
    /// Creates a styled button with an image on the left side.
    ///
    /// Use this function to create a button with a specific text, font, colors, corner radius, an associated action, and an image on the left side.
    ///
    /// - Parameters:
    ///   - text: The text to display on the button.
    ///   - font: The font to apply to the button text.
    ///   - backgroundColor: The background color of the button.
    ///   - textColor: The color of the button's text.
    ///   - cornerRadius: The corner radius of the button.
    ///   - action: The action to perform when the button is tapped.
    ///   - imageName: The name of the system image to display on the left side.
    ///   - imageName: The name of the system image to display on the left side.
    ///   - imageWidth: The width of the image.
    ///   - imageHeight: The height of the image.
    ///
    /// - Returns: A view representing the styled button with an image on the left side.
    ///
    /// If you want to use this Button with a custom Image you need to use this code:
    /// ```swift
    ///   SLImageButton(text: "Press Me",
    ///   font: .system(size: 18),
    ///   backgroundColor: .blue,
    ///   textColor: .white,
    ///   cornerRadius: 10,
    ///   image: Image("customImage"), // Provide your custom image
    ///   imageWidth: 30,
    ///   imageHeight: 30) {
    ///       // action to perform when the button is tapped
    ///   }
    /// ```
    ///
    /// If you want to use this Button with a system Image you need to use this code:
    /// ```swift
    /// SLImageButton(text: "Press Me",
    /// font: .system(size: 18),
    /// backgroundColor: .blue,
    /// textColor: .white,
    /// cornerRadius: 10,
    /// systemImageName: "heart.fill", // Provide system image name
    /// imageWidth: 30,
    /// imageHeight: 30) {
    ///   // The action to perform when the button is tapped comes here.
    /// }
    /// ```
    ///
    /// > Important: To use this Button for Auth use as background Color .clear
    func SLImageButton(text: String, font: Font, backgroundColor: Color, textColor: Color, cornerRadius: CGFloat, image: Image? = nil, systemImageName: String? = nil, imageWidth: CGFloat, imageHeight: CGFloat, action: @escaping () -> Void) -> some View {
        SLButton_Image(text: text, font: font, textColor: textColor, backgroundColor: backgroundColor, cornerRadius: cornerRadius, action: action, image: image, systemImageName: systemImageName, imageWidth: imageWidth, imageHeight: imageHeight)
        }
}

// MARK: - SLButton Test View
/// A view to test the functionality of the `SLImageButton`.
///
/// This view provides examples of using the `SLImageButton` with different configurations and images.
///
/// Example Usage:
/// ```swift
/// SLImageButton(text: String, 
/// font: Font, 
/// backgroundColor: Color,
/// textColor: Color,
/// cornerRadius: CGFloat,
/// image: Image?,
/// imageWidth: CGFloat,
/// imageHeight: CGFloat,
/// action: @escaping () -> Void)
/// ```
struct SLButton_ImageTestView: View {
    var body: some View {
        VStack {
            Text("This is a View to test the SLImageButtons!")
                .padding()
            
            // Example of using SLImageButton with a custom image
            SLImageButton(text: "Continue With Google", font: .subheadline, backgroundColor: Color(.clear), textColor: .black, cornerRadius: 10, image: Image("google"), imageWidth: 30, imageHeight: 30) {
                print("Button was pressed!")
            }
            
            // Example of using SLImageButton with a different custom image
            SLImageButton(text: "Continue With Apple", font: .subheadline, backgroundColor: Color(.clear), textColor: .black, cornerRadius: 10, image: Image("apple-logo-black"), imageWidth: 30, imageHeight: 30) {
                print("Button was pressed!")
            }
            
            // Example of using SLImageButton with a system image
            SLImageButton(text: "Continue With Email", font: .subheadline, backgroundColor: Color(.clear), textColor: .black, cornerRadius: 10, systemImageName: "envelope.fill", imageWidth: 30, imageHeight: 30) {
                print("Button was pressed!")
            }.tint(.black)
            
            // Example of using SLImageButton with a system image and different background color
            SLImageButton(text: "Tab on me", font: .subheadline, backgroundColor: .orange, textColor: .black, cornerRadius: 10, systemImageName: "gearshape", imageWidth: 30, imageHeight: 30) {
                print("Button was pressed")
            }.tint(.black)
        }
    }
}

#Preview {
    SLButton_ImageTestView()
}

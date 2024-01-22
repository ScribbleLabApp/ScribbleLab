//
//  IGTextFieldModifier.swift
//  ScribbleLabCoreUI
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

/// A Modifier that is responsible for the styling of the TextFields
struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            /*.font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
             */
            .font(.subheadline)
            .padding(12)
            .cornerRadius(10)
            .background {
                RoundedRectangle(cornerRadius: 15)
                .strokeBorder(Color(red: 194/255, green: 194/255, blue: 194/255), lineWidth: 0.5)
            }
            .frame(width: 359)
    }
}

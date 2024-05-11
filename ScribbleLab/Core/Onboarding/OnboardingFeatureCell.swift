//
//  OnboardingFeatureCell.swift
//  ScribbleLab
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp. All rights reserved
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
//  Authors:
//  - NH: https://github.com/N3v1

import SwiftUI

struct OnboardingFeatureCell: View {
    var data: FeatureCell
    
    var body: some View {
        VStack {
            Image(data.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
                .padding(.vertical, 20)
            
            VStack(spacing: 25) {
                Text(data.title)
                    .font(.title)
                    .bold()
                
                Text(data.description)
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .padding(.vertical, 5)
                    .padding(.bottom, 10)
            }
        }
        .padding(5)
    }
}

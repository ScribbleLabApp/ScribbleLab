//
//  Log.swift
//  ScribbleDeveloper
//
//  Created by N3v1 on 23/03/24.
//  Copyright © 2024 ScribbleLabApp. All rights reserved.
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
import os

/// ScribbleDeveloper logger
///
/// Logger configuration:\
/// subsystem: com.nhstudio\
/// category: ScribbleDeveloper
let Log = Logger( // swiftlint:disable:this identifier_name
    subsystem: "com.nhstudio",
    category: "ScribbleDeveloper"
)

extension View {
    /// Log
    /// This enables:
    ///
    ///  ```swift
    ///  SomeSwiftUIView()
    ///  .log {
    ///    // Code you need to run
    ///  }
    ///  ```
    ///
    /// - Parameter closure: Code need to run
    /// - Returns: self
    func log(_ closure: () -> Void) -> some View {
        return self
    }
}

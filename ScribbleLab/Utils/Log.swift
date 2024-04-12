//
//  Log.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 12.04.24.
//

import SwiftUI
import os

/// ScribbleLab logger
/// **Logger configuration:**              \
/// **subsystem:**                               com.scribblelab\
/// **category:**                                   ScribbleLab
let Log = Logger( // swiftlint:disable:this identifier_name
    subsystem: "com.nhstudiio",
    category: "ScribbleLab"
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

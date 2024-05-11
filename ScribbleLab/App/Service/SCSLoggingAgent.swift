//
//  SCSLoggingAgent.swift
//  ScribbleLab Core
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
//  Authors:
//  - NH: https://github.com/N3v1
//

import Foundation
import ScribbleCoreServices

/// `SCNLoggingAgent` manages a shared instance of `SCNLog` for logging throughout the app.
class SCNLoggingAgent {
    
    /// Shared instance of `SCNLoggingAgent`.
    static let shared = SCNLoggingAgent()
    
    /// The logger instance for logging messages.
    let logger: SCNLog
    
    /// Initializes a new `SCNLoggingAgent` instance with a subsystem identifier.
    private init() {
        logger = SCNLog(subsystem: "com.nhsystems.ScribbleLab")
    }
}

//
//  SCSCrashExceptionAgent.swift
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

import UIKit
import Dispatch
import Foundation
import FirebaseCrashlytics
import ScribbleCoreServices

/// An agent responsible for handling uncaught exceptions and reporting crashes.
class SCSCrashExceptionAgent: NSObject, ObservableObject {
    
    // The shared instance of SCSCrashExceptionAgent.
    static let shared = SCSCrashExceptionAgent()
    
    /// The queue for handling exceptions asynchronously.
    private let queue = DispatchQueue(label: "com.ScribbleLab.crashExceptionQueue")
    
    /// Initializes the SCSCrashExceptionAgent.
    private override init() {
        super.init()
        setupExceptionHandler()
    }
    
    /// Indicates whether an uncaught exception has been recorded.
    @Published var isUncaughtExceptionRecorded: Bool = false
    
    /// Sets up the exception handler to capture uncaught exceptions.
    private func setupExceptionHandler() {
        self.queue.async {
            NSSetUncaughtExceptionHandler { exception in
                SCSCrashExceptionAgent.shared.exceptionHandler(exception: exception)
            }
        }
    }
    
    /// Handles the uncaught exception by recording it.
    /// - Parameter exception: The uncaught exception.
    func exceptionHandler(exception: NSException) {
        Crashlytics.crashlytics().record(error: exception as! NSError)
        self.isUncaughtExceptionRecorded = true
    }
}

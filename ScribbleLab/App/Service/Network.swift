//
//  Network.swift
//  ScribbleLab Networking/Core
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

import Foundation
import Network

/// A class responsible for monitoring the device's network connectivity.
///
/// This class utilizes NWPathMonitor to observe changes in the network path
/// and updates the `isInternetConnected` property based on the current network status.
///
class Network: ObservableObject {
    /// A published property indicating whether the device is currently connected to the internet.
    @Published var isInternetConnected = false

    private let monitor = NWPathMonitor()

    static let shared = Network()
    
    /// Initializes the network monitoring process and begins monitoring the network status.
    init() {
        startMonitoring()
    }

    /// Starts monitoring the network status using NWPathMonitor.
    func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isInternetConnected = path.status == .satisfied
            }
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
}

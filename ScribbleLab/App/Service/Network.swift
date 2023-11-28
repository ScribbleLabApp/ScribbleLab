//
//  Network.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 24.11.23.
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

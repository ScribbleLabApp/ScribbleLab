//
//  StoreView.swift
//  ScribbleLab
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

import UIKit
import SwiftUI
import StoreKit

/// A View that shows the app store with a selected app
///
/// `StoreView` is a Swift `UIViewControllerRepresentable` struct designed to integrate a `StoreKit` product view controller into SwiftUI-based applications. This struct facilitates the seamless presentation of App Store product information within a SwiftUI view hierarchy.
///
/// ### Properties
/// - appID: A required property representing the iTunes item identifier of the App or product to be displayed in the StoreKit product view controller.
struct StoreView: UIViewControllerRepresentable {
    let appID: String
     
    func makeUIViewController(context: UIViewControllerRepresentableContext<StoreView>) -> SKStoreProductViewController {
        let sKStoreProductViewController = SKStoreProductViewController()
        let parameters = [ SKStoreProductParameterITunesItemIdentifier : appID]
        sKStoreProductViewController.loadProduct(withParameters: parameters)
        return sKStoreProductViewController
    }

    func updateUIViewController(_ uiViewController: SKStoreProductViewController, context: UIViewControllerRepresentableContext<StoreView>) {

    }
}

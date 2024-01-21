//
//  StoreView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.01.24.
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

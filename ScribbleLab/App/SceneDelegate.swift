//
//  SceneDelegate.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 10.12.23.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let rootView = ContentView()
        
        // [ START check_for_multitasking_support]
        if let splitViewController = createSplitViewController(rootView: rootView) {
            window.rootViewController = splitViewController
        } else {
            let hostingController = UIHostingController(rootView: rootView)
            window.rootViewController = hostingController
        }
        // [ END check_for_multitasking_support]
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
    private func createSplitViewController(rootView: some View) -> UISplitViewController? {
        if UIDevice.current.userInterfaceIdiom == .pad {
            let splitViewController = UISplitViewController()
            let primaryViewController = UIHostingController(rootView: rootView)
            let secondaryViewController = UIViewController()
            
            splitViewController.preferredDisplayMode = .oneBesideSecondary
            splitViewController.viewControllers = [primaryViewController, secondaryViewController]
            
            return splitViewController
        }
        return nil
    }
}

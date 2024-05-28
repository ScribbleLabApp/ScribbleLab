// ===----------------------------ScribbleLabCore-SceneDelegate------------------------------=== //
//                                                                                               //
//  SceneDelegate.swift                                                                          //
//  ScribbleLab                                                                                  //
//                                                                                               //
//  Copyright (c) 2023 - 2024 ScribbleLabApp. All rights reserved.                               //
//                                                                                               //
//  Licensed under the Apache License, Version 2.0 (the "License");                              //
//  you may not use this file except in compliance with the License.                             //
//  You may obtain a copy of the License at                                                      //
//                                                                                               //
//       http://www.apache.org/licenses/LICENSE-2.0                                              //
//                                                                                               //
//  Unless required by applicable law or agreed to in writing, software                          //
//  distributed under the License is distributed on an "AS IS" BASIS,                            //
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                     //
//  See the License for the specific language governing permissions and                          //
//  limitations under the License.                                                               //
//                                                                                               //
// See https://github.com/ScribbleLabApp/ScribbleLab/blob/main/LICENSE for license information   //
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors                  //
//                                                                                               //
// ===---------------------------------------------------------------------------------------=== //
  
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
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

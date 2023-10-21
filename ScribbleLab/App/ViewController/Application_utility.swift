//
//  Application_utility.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 21.10.23.
//

import SwiftUI
import UIKit

final class Application_utility: UIViewController {
    static var UIViewController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}

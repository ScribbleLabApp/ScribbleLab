//
//  AppDelegate.swift
//  ScribbleDeveloper
//
//  Created by Nevio Hirani on 24.03.24.
//

import SwiftUI
import Combine

final class ScribbleDeveloperApplication: NSApplication {
    let strongDelegate = AppDelegate()

    override init() {
        super.init()
        self.delegate = strongDelegate
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

@NSApplicationMain
final class AppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
    func applicationWillFinishLaunching(_ notification: Notification) {}
    
    var statusItem: NSStatusItem?
    
    // private var updateModel: UpdateObservedModel = .shared
    // private var languageRegistery: LanguageRegistry = .shared
    
    var cancellable = Set<AnyCancellable>()
}

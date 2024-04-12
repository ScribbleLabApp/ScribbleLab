//
//  DockProgress.swift
//  ScribbleLabCore
//
//  Copyright (c) 2024 ScribbleLabApp.
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

import SwiftUI

#if os(macOS)
import Cocoa

extension NSApplication {
    func setDockProgress(progress: Double) {
        let dockTile = NSApplication.shared.dockTile
        guard let image = NSApplication.shared.applicationIconImage else { return }
        let imageView = NSImageView(image: image)
        dockTile.contentView = imageView
        // add the progress indicator to the dock tile view
        imageView.image = drawProgress(on: image, progress: progress)
        dockTile.display()
    }

    func removeDockProgress() {
        let dockTile = NSApplication.shared.dockTile
        guard let image = NSApplication.shared.applicationIconImage else { return }
        dockTile.contentView = NSImageView(image: image)
        dockTile.display()
    }
    
    // drawProgress
    
    // ...
}
#endif

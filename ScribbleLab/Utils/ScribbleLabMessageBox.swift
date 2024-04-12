//
//  ScribbleLabMessageBox.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 12.04.24.
//

import Foundation
import SwiftUI

#if os(macOS)
/// Show a message box
/// - Parameters:
///   - type: Style/Type
///   - message: Message
/// - Returns: true on ok, false on cancel
@discardableResult
func scribblelabMessageBox(type: NSAlert.Style, message: String) -> Bool {
    let alert: NSAlert = NSAlert()
    alert.messageText = "ScribbleLab"
    alert.informativeText = message
    alert.alertStyle = type
    alert.addButton(
        withTitle: NSLocalizedString("Ok", comment: "Ok")
    )
    if type != .critical {
        alert.addButton(
            withTitle: NSLocalizedString("Cancel", comment: "Cancel")
        )
    }
    let res = alert.runModal()
    if res == NSApplication.ModalResponse.alertFirstButtonReturn {
        return true
    }
    return false
}
#endif

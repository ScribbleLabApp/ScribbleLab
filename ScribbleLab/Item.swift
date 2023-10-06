//
//  Item.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 06.10.23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

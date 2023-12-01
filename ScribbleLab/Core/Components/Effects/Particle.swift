//
//  Particle.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 15.11.23.
//

import SwiftUI

/// Particle model
struct Particle: Identifiable {
    var id: UUID = .init()
    
    var randomX: CGFloat = 0
    var randomY: CGFloat = 0
    var scale: CGFloat = 1
    
    var opacity: CGFloat = 1
    
    /// Reset all properties
    mutating func reset() {
        randomX = 0
        randomY = 0
        scale = 1
        opacity = 1
    }
}

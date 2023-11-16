//
//  ParticleEffect.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 15.11.23.
//

import SwiftUI

/// Custom View Modifier
extension View {
    @ViewBuilder
    func particleEffect(systemImage: String, font: Font, status: Bool, activeTint: Color, inActiveTint: Color) -> some View {
        self
            .modifier(
                ParticleModifier(systemImage: systemImage, font: font, status: status, activeTint: activeTint, inActiveTint: inActiveTint)
            )
    }
}

fileprivate struct ParticleModifier: ViewModifier {
    var systemImage: String
    var font: Font
    var status: Bool
    var activeTint: Color
    var inActiveTint: Color
    
    /// View Properties
    @State private var particles: [Particle] = []
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                ZStack {
                    ForEach(particles) { particle in
                        Image(systemName: systemImage)
                            .foregroundStyle(status ? activeTint : inActiveTint)
                            .scaleEffect(particle.scale)
                            .offset(x: particle.randomX, y: particle.randomY)
                            .opacity(particle.opacity)
                            .opacity(status ? 1 : 0)
                        
                            /// Making base visibility with zero animation
                            .animation(.none, value: status)
                    }
                }
                .onAppear {
                    /// Adding base particles for animation
                    if particles.isEmpty {
                        for _ in 1...15 {
                            let particle = Particle()
                            particles.append(particle)
                        }
                    }
                }
            }
    }
}

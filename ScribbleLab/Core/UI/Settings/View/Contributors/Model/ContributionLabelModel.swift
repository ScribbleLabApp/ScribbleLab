//
//  ContributionLabelModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 24.01.24.
//

import SwiftUI
import Foundation

enum ContributionLabelSpecies: String, CaseIterable, Identifiable, Hashable {
    case bugFix
    case design
    case testing
    case feature
    case documentation
    case maintanance
    
    var string: String {
        switch self {
        case .bugFix:
            return "BUG FIX"
        case .design:
            return "DESIGN"
        case .testing:
            return "TESTING"
        case .feature:
            return "FEATURE"
        case .documentation:
            return "DOCS"
        case .maintanance:
            return "MAINTAINANCE"
        }
    }
    
    var labelColor: Color {
        switch self {
        case .bugFix:
            return .red
        case .design:
            return .blue
        case .testing:
            return .teal
        case .feature:
            return .orange
        case .documentation:
            return .orange
        case .maintanance:
            return .indigo
        }
    }
    
    var id: String { self.rawValue }
}

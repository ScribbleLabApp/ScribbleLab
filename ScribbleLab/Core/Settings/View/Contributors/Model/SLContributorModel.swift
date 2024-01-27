//
//  SLContributorModel.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 08.10.23.
//

import Foundation
import SwiftUI

enum SLContributorModel: Int, CaseIterable, Identifiable, Hashable, Codable {
    case nevio
    case kilian
    case mcrich
    case minaelee
    
    var name: String {
        switch self {
        case .nevio: return "Nevio Hirani"
        case .kilian: return "Kilian Balaguer"
        case .mcrich: return "Morris Richman"
        case .minaelee: return "Minae Lee"
        }
    }
    
    var image: String {
        switch self {
        case .nevio: return ""
        case .kilian: return ""
        case .mcrich: return ""
        case .minaelee: return ""
        }
    }
    
    var section: ContributionLabelSpecies {
        switch self {
        case .nevio: return .maintanance
        case .kilian: return .maintanance
        case .mcrich: return .bugFix
        case .minaelee: return .documentation
        }
    }
    
    var githubURL: String {
        switch self {
        case .nevio: return "https://github.com/N3v1"
        case .kilian: return "https://github.com/appletech75"
        case .mcrich: return "https://github.com/Mcrich23"
        case .minaelee: return "https://github.com/minaelee"
        }
    }
    
    var id: Int { return self.rawValue }
}

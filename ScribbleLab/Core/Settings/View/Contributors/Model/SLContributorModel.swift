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
    case giorgio
    
    var name: String {
        switch self {
        case .nevio: return "Nevio Hirani"
        case .kilian: return "Kilian Balaguer"
        case .giorgio: return "Giorgio Ntinos"
        }
    }
    
    var land: String {
        switch self {
        case .nevio: return "🇩🇪 & 🇮🇹"
        case .kilian: return "🇳🇱"
        case .giorgio: return "🇩🇪, 🇬🇷 & 🇧🇦"
        }
    }
    
    // TODO: Get images from GitHub
    var image: String {
        switch self {
        case .nevio: return ""
        case .kilian: return ""
        case .giorgio: return ""
        }
    }
    
    var section: String {
        switch self {
        case .nevio: return "👮‍♂️ 👨‍💻 🐞 🪄"
        case .kilian: return "👨‍💻 🐞 🪄"
        case .giorgio: return "📱"
        }
    }
    
    var githubURL: String {
        switch self {
        case .nevio: return "https://github.com/N3v1"
        case .kilian: return "https://github.com/appletech75"
        case .giorgio: return "" // TODO: Add Github link - staff only
        }
    }
    
//    var urlStringAdress: String {
//        switch self {
//        case .nevio: return "https://avatars.githubusercontent.com/u/129311622?v=4"
//        case .kilian: return "https://avatars.githubusercontent.com/u/122736906?v=4"
//        case .giorgio: return ""
//        }
//    }
    var id: Int { return self.rawValue }
}

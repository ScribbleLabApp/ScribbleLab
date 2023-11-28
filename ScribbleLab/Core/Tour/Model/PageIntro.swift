//
//  PageIntro.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 18.11.23.
//

import SwiftUI

/// Page Intro Model
struct PageIntro: Identifiable, Hashable {
    var id: UUID = .init()
    var introAssetImage: String
    var title: String
    var subtitle: String
    var description: String
    var displayAction: Bool = false
}

var pageIntro: [PageIntro] = [
    .init(introAssetImage: "people-intro", title: "Welcome to ScribbleLab", subtitle: "Start your note-taking journey by following this Tutorial", description: "To become a ScribbleLab Pro follow this Tutorial in order to become more familiar with ScribbleLab."),
    .init(introAssetImage: "note-taking-woman", title: "Explore our Editor functionalities", subtitle: "", description: ""),
    .init(introAssetImage: "person-illustartion-grade", title: "", subtitle: "", description: "", displayAction: true),
//    .init(introAssetImage: <#T##String#>, title: <#T##String#>, subtitle: <#T##String#>, description: <#String#>, displayAction: <#T##Bool#>)
]

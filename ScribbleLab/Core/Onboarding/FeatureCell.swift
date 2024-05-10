//
//  FeatureCell.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 09.05.24.
//

import Foundation

struct FeatureCell: Codable, Identifiable, Hashable {
    var imageName: String
    var title: String
    var description: String
    var id: Int
}

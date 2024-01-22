//
//  DocumentSortOption_iPad.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 22.01.24.
//

import Foundation

enum DocumentSortOptionFavourite: String, CaseIterable, Identifiable {
    case date = "Date"
    case owner = "Owner"
    case title = "Title"
    case changes = "Modification date"
    
    var id: String { self.rawValue }
}

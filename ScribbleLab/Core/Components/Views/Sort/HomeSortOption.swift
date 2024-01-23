//
//  HomeSortOption.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 23.01.24.
//

import Foundation

enum SortOption: Equatable, CaseIterable, Identifiable {
    case symbols
    case list
    
    var image: String {
        switch self {
        case .symbols:
            return "square.grid.2x2"
        case .list:
            return "list.bullet"
        }
    }
    
    var id: String {
        switch self {
        case .symbols:
            return "symbols"
        case .list:
            return "list"
        }
    }
    
    mutating func toggle() {
        self = (self == .symbols) ? .list : .symbols
    }
}

class HomeSortOptionModel: ObservableObject {
    @Published var displayMode: SortOption = .symbols
}

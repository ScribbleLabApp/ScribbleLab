//
//  CropView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 04.11.23.
//  Copyright © 2023 - 2024 ScribbleLabApp. All rights reserved.
//  Restricted use for ScribbleLab only.
//

import SwiftUI

// MARK: Crop config
/// An enum that is used for croping images and has 4 diffrent cases:
///  - Circle: Circular cropping **for Profile Images**
///  - Rectangle: For Rectangular cropping e.g. normal img in the editor, ...
///  - square: For squareable cropping
///  - custom: A CGSize is needed to use this case
///
///  In order to use the custom modifier you have to declare cGSize as a let first:
///  ```swift
///  switch self {
///     case .custom(let cGSize):
///  }
///  ```
///
///  The enum is reusable and can be used everywhere in this application where you work with ImagePickerItems.
///
///  The crop config enum uses two functions:
///    - ```name()```
///    - ```size()```
///
enum Crop: Equatable {
    case circle
    case rectangle
    case square
    case custom(CGSize)
    
    /// A function that returns a String value which contains the name of the case which will be displayed in an action everytime you select an image.
    func name() -> String {
        switch self {
        case .circle: return "Cricle"
        case .rectangle: return "Rectangle"
        case .square: return "Square"
        case .custom(let cGSize): return "Custom \(Int(cGSize.width)) x \(Int(cGSize.height))"
        }
    }
    
    /// A function that returns a CGSize value which contains the size of the case. It's needed for the actual cropping of the image
    func size() -> CGSize {
        switch self {
        case .circle: return .init(width: 150, height: 150)
        case .rectangle: return .init(width: 300, height: 500)
        case .square: return.init(width: 300, height: 300)
        case .custom(let cGSize): return cGSize
        }
    }
}

//
//  ScribbleProject.swift
//  ScribbleDeveloper
//
//  Created by Nevio Hirani on 23.03.24.
//

import Foundation

struct ScribbleProjectFile: Codable {
    var file: String
    var time: Int
}

/// ScribbleProject
struct ScribbleProject: Codable {
    var scribbleProject: String?
    var files: [String]?
    var lastSearch: String?
    var lastReplace: String?
    var lastOpenFile: String?
    var state: String? // State.

    /* Nerd stats */
    var totalTimeSpend: Int?
    var timeOn: [ScribbleProjectFile]?
}

/*
 {
     "scribbleProject": "1.0",
     "files": [
         "a.ext",
         "b.ext",
         "c.ext"
     ],
     "lastSearch": null,
     "lastReplace": null,
     "lastOpenFile": null,
     "state": null,
     "totalTimeSpend": 60,
     "timeOn": [
         {"file": "a.ext","time": 10},
         {"file": "b.ext","time": 20},
         {"file": "c.ext","time": 30},
     ]
 }
 */

//
//  OxfordVocabulary.swift
//  Dictionary
//
//  Created by admin on 30/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import Foundation

// MARK: - OxfordVocabulary
struct OxfordVocabulary:Codable {
    let word:String
    let typeWord:String
    let pronounciation:String
    let meaning:String
    enum CodingKeys:String, CodingKey{
        case word
        case typeWord = "typeword"
        case pronounciation
        case meaning
    }
}

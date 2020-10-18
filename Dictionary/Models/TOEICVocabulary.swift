//
//  TOEICVocabulary.swift
//  Dictionary
//
//  Created by admin on 05/10/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import Foundation

// MARK: - TOEICVocabulary
struct TOEICVocabulary: Codable {
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

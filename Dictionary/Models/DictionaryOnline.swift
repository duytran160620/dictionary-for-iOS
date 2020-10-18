//
//  APIStruct.swift
//  Dictionary
//
//  Created by admin on 22/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import Foundation

// MARK: - DictionaryOnline
struct DictionaryOnline: Codable {
    let language: String
    let sentences: [Sentence]
}

// MARK: - Sentence
struct Sentence: Codable {
    let id: String
    let fields: FieldsOfDictionary
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case fields = "fields"
    }
}

// MARK: - Fields
struct FieldsOfDictionary: Codable {
    let en, vi: String
}

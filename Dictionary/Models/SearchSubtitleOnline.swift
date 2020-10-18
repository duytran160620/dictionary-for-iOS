//
//  SearchSubtileOnline.swift
//  Dictionary
//
//  Created by admin on 25/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import Foundation
import UIKit

// MARK: - SubtileOnline
struct SearchSubtitleOnline: Codable {
    let language: String
    let subtitles: [Subtitle]
}

// MARK: - Subtitle
struct Subtitle: Codable {
    let id: String
    let fields: FieldsOfSubtitle
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case fields = "fields"
    }
}

// MARK: - Fields
struct FieldsOfSubtitle: Codable {
    let en, movieTitle, snippet, thumbnail: String
    let vi: String
    
    enum CodingKeys: String, CodingKey {
        case en
        case movieTitle = "movie_title"
        case snippet, thumbnail, vi
    }
}

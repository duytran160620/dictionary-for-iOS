//
//  StoryboardConstants.swift
//  Dictionary
//
//  Created by admin on 22/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import Foundation

struct StoryboardConstants {
    static let segueAnhViet = "Segue-Anh-Viet"
    static let segueVietAnh = "Segue-Viet-Anh"
    static let seguePhuDePhim = "Segue-Phụ-Đề-Phim"
    static let segueShowDetail = "Segue-Show-Detail"
    static let segueVocabularyImportant = "Segue-Vocabulary-Important"
    static let segueDetailVocabulary = "Segue-Detail-Vocabulary"
    static let resultCell = "ResultCell"
    static let subtitleCell = "SubtitleCell"
    static let vocabularyCell = "VocabularyCell"
    static let wordItemTableViewCell = "WordItemTableViewCell"
    static let popupVocabularyVC = "PopupVocabularyVC"
}
struct API {
    static let BASE_URL = "https://api.tracau.vn/"
    static let API_KEY = "WBBcwnwQpV89"
    static let API_URL = API.BASE_URL + API.API_KEY
}


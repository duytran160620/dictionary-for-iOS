//
//  StoryboardConstants.swift
//  Dictionary
//
//  Created by admin on 22/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit

struct StoryboardConstants {
    static let segueAnhViet = "Segue-Anh-Viet"
    static let segueVietAnh = "Segue-Viet-Anh"
    static let seguePhuDePhim = "Segue-Phụ-Đề-Phim"
    static let segueShowDetail = "Segue-Show-Detail"
    static let segueVocabularyImportant = "Segue-Vocabulary-Important"
    static let segueDetailVocabulary = "Segue-Detail-Vocabulary"
    static let segueWordSearchedVC = "WordSearchedVC"
    static let resultCell = "ResultCell"
    static let subtitleCell = "SubtitleCell"
    static let vocabularyCell = "VocabularyCell"
    static let wordItemTableViewCell = "WordItemTableViewCell"
    static let popupVocabularyVC = "PopupVocabularyVC"
    static let wordSearchedCell = "WordSearchedCell"
}
struct API {
    static let BASE_URL = "https://api.tracau.vn/"
    static let API_KEY = "WBBcwnwQpV89"
    static let API_URL = API.BASE_URL + API.API_KEY
}

struct Colors {
    static let heavyBlack = UIColor(red: 16/255, green: 19/255, blue: 34/255, alpha: 1)
    static let blackBlue = UIColor(red: 26/255, green: 55/22, blue: 86/255, alpha: 1)
    static let lightBlue = UIColor(red: 64/255, green: 103, blue: 135/255, alpha: 1)
    static let mediumBlue = UIColor(red: 49/255, green: 55/255, blue: 80/255, alpha: 1)
}
extension UIView {
    func setGradientBackground(firstColor:UIColor, secondColor:UIColor)
    {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = [firstColor.cgColor, secondColor.cgColor]
        layer.locations = [0, 1,2,3]
        layer.startPoint = CGPoint(x: 1, y: 1)
        layer.endPoint = CGPoint(x: 0, y: 0)
        self.layer.addSublayer(layer)
    }
}
extension Array where Element: Hashable {
    var removeDuplicated: Array {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}

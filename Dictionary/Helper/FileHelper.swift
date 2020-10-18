//
//  FileHelper.swift
//  Dictionary
//
//  Created by admin on 05/10/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import Foundation


class FileHelper {
    class func readFileOxfordVocabularyJSON(nameFile:String, completion: @escaping ([OxfordVocabulary]) -> ()) {
        let path = Bundle.main.path(forResource: nameFile, ofType: "json")
        guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: path!), encoding: .utf8) else {
            return
        }
        var oxford:[OxfordVocabulary]?
        do {
            oxford = try JSONDecoder().decode([OxfordVocabulary].self, from: Data(jsonString.utf8))
            completion(oxford!)
        }catch {
            print(error.localizedDescription)
        }
    }
    class func readFileIrregularVerbsJSON(nameFile:String, completion: @escaping ([IrregularVerbs]) -> ()) {
        let path = Bundle.main.path(forResource: nameFile, ofType: "json")
        guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: path!), encoding: .utf8) else {
            return
        }
        var oxford:[IrregularVerbs]?
        do {
            oxford = try JSONDecoder().decode([IrregularVerbs].self, from: Data(jsonString.utf8))
            completion(oxford!)
        }catch {
            print(error.localizedDescription)
        }
    }
    class func readFileTOEICVocabularyJSON(nameFile:String, completion: @escaping ([TOEICVocabulary]) -> ()) {
        let path = Bundle.main.path(forResource: nameFile, ofType: "json")
        guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: path!), encoding: .utf8) else {
            return
        }
        var oxford:[TOEICVocabulary]?
        do {
            oxford = try JSONDecoder().decode([TOEICVocabulary].self, from: Data(jsonString.utf8))
            completion(oxford!)
        }catch {
            print(error.localizedDescription)
        }
    }
}


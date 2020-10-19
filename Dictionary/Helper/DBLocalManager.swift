//
//  DBLocalManager.swift
//  Dictionary
//
//  Created by admin on 19/10/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit
import CoreData

class DBLocalManager {
    static let shared = DBLocalManager()
    private init () { }
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public func insertNewWord(word:String, sentence:Sentence) {
        let vocabulary = WordSearched()
        vocabulary.word = word
        vocabulary.english = sentence.fields.en
        vocabulary.vietnamese = sentence.fields.vi
        do {
            try context.save()
        }catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    public func deleteData(item:WordSearched) {
        context.delete(item)
        do {
            try context.save()
        }catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

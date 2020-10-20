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
    private var words:[Word] = []
    private var examples:[Example] = []
    
    
    public func insertNewWord(word:String, examples: [Sentence]) {
        let vocabulary = Word(context: context)
        vocabulary.word = word
        for item in examples {
            let example = Example(context: context)
            example.word = vocabulary
            example.english = item.fields.en
            example.vietnamese = item.fields.vi
        }
        do {
            try context.save()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    public func fetchWordFromLocal(completion:@escaping ([Word]) -> ()) {
        do {
            self.words = try context.fetch(Word.fetchRequest())
            DispatchQueue.main.async {
                completion(self.words)
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    public func fetchExampleFromLocal(with word:Word,completion:@escaping ([Example]) -> ()) {
        var temp:[Example] = []
        do {
            self.examples = try context.fetch(Example.fetchRequest())
            temp = examples.filter({ (example) -> Bool in
                return example.word?.word == word.word
            })
            DispatchQueue.main.async {
                completion(temp)
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    public func delete(word:Word) {
        self.context.delete(word)
        do {
            try context.save()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

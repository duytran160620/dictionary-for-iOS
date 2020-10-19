//
//  WordSearched+CoreDataProperties.swift
//  Dictionary
//
//  Created by admin on 19/10/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//
//

import Foundation
import CoreData


extension WordSearched {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordSearched> {
        return NSFetchRequest<WordSearched>(entityName: "WordSearched")
    }

    @NSManaged public var english: String?
    @NSManaged public var vietnamese: String?
    @NSManaged public var word: String?
    

}

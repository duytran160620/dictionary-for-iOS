//
//  Word+CoreDataProperties.swift
//  Dictionary
//
//  Created by admin on 19/10/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var word: String?
    @NSManaged public var examples: NSSet?

}

// MARK: Generated accessors for examples
extension Word {

    @objc(addExamplesObject:)
    @NSManaged public func addToExamples(_ value: Example)

    @objc(removeExamplesObject:)
    @NSManaged public func removeFromExamples(_ value: Example)

    @objc(addExamples:)
    @NSManaged public func addToExamples(_ values: NSSet)

    @objc(removeExamples:)
    @NSManaged public func removeFromExamples(_ values: NSSet)

}

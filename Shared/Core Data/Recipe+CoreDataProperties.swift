//
//  Recipe+CoreDataProperties.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 24/06/2021.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var instructions: [String]?
    @NSManaged public var ingredients: [String]?
    @NSManaged public var image: Data?

}

extension Recipe : Identifiable {

}

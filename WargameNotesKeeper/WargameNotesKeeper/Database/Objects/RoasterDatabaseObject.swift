//
//  RoasterDatabaseObject.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 19/08/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import RealmSwift

class RoasterDatabaseObject: Object {
    
    var identifier: String!
    var name: String!
    var gameSystem: GameSystemDatabaseObject?
    
    static func new(_ roasterName: String, system: GameSystemDatabaseObject? = nil) -> RoasterDatabaseObject {
        
        let object = RoasterDatabaseObject()
        object.identifier = NSUUID().uuidString
        object.name = roasterName
        object.gameSystem = system
        
        return object
    }
}

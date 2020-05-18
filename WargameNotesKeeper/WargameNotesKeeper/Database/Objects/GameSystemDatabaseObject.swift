//
//  GameSystemDatabaseObject.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 19/08/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import RealmSwift

class GameSystemDatabaseObject: Object {
    
    var identifier: String!
    var name: String!
    var imageData: Data?
    
    static func new(_ systemName: String, pictureData: Data? = nil) -> GameSystemDatabaseObject {
        
        let object = GameSystemDatabaseObject()
        object.identifier = NSUUID().uuidString
        object.name = systemName
        object.imageData = pictureData
        
        return object
    }
}

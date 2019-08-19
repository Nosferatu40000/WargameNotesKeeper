//
//  RoasterListViewModel.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 19/08/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation

class RoasterListViewModel {
    
    var database: DatabaseService!
    
    var roasters: [RoasterDatabaseObject] = []
    
    func viewLoaded() {
        updateRoasterList()
    }
    
    func updateRoasterList() {
        
        roasters = allRoasters()
    }
    
    private func allRoasters() -> [RoasterDatabaseObject] {
        
        guard let roasters = database.findObjects(RoasterDatabaseObject.self) as? [RoasterDatabaseObject] else {
            return []
        }
        return roasters
    }
    
    func didSelectRoaster(_ index: Int) {
        
    }
}

//
//  RoasterListViewModel.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 19/08/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit

class RoasterListViewModel {
    
    var interactor: RoasterListInteractor!
    var database: DatabaseService!
    var router: RoasterListRouter!
    
    var roasters: [RoasterDatabaseObject] = []
    
    let moduleTitle = "Roasters"
    var rightHeaderButtons: [UIBarButtonItem]?
    
    func viewLoaded() {
        rightHeaderButtons = [UIBarButtonItem.init(title: "⚙", style: .plain, target: self, action: #selector(didTapSettings))]
    }
    
    func viewAppeared() {
        
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
    
    @objc func didTapSettings() {
        self.router.openSettingsController()
    }
    
}

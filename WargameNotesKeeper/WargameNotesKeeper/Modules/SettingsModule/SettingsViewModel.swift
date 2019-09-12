//
//  SettingsViewModel.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 12/09/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class SettingsViewModel: ModuleViewModel {
    
    var moduleTitle: String = "Settings"
    var rightHeaderButtons: [UIBarButtonItem] = []
    var leftHeaderButtons: [UIBarButtonItem] = []
    var placeholder: UIImage? = UIImage(named: "gameSystemPlaceholder")
    
    var interactor: SettingsInteractor!
    var router: SettingsRouter!
    var database: DatabaseService!
    
    var dataObjects: [Object] = []
    
    func viewLoaded() {
        
        setHeaderButton()
    }
    
    func viewAppeared() {
        
        dataObjects = allSystems()
    }
    
    func setHeaderButton() {
        
        let addNewButton = UIButton.init(type: .system)
        addNewButton.setImage(UIImage(named: "Add"), for: .normal)
        addNewButton.frame = CGRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0)
        
        addNewButton.translatesAutoresizingMaskIntoConstraints = false
        addNewButton.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        addNewButton.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        addNewButton.addTarget(self, action: #selector(addGameSystem), for: .touchUpInside)
        rightHeaderButtons = [UIBarButtonItem.init(customView: addNewButton)]
    }
    
    private func allSystems() -> [GameSystemDatabaseObject] {
        
        guard let systems = database.findObjects(GameSystemDatabaseObject.self) as? [GameSystemDatabaseObject] else {
            return []
        }
        return systems
    }
    
    @objc func addGameSystem() {
        
    }
    
    func didSelectGameSystem(_ row: Int) {
        
    }
}

//
//  UnitListModuleViewModel.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 13/06/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class UnitListModuleViewModel: ModuleViewModel {
    
    var moduleTitle: String = "Units"
    var rightHeaderButtons: [UIBarButtonItem] = []
    var leftHeaderButtons: [UIBarButtonItem] = []
    var placeholder: UIImage?
    
    var interactor: UnitListModuleInteractor!
    var database: DatabaseService!
    
    var dataObjects: [Object] = []
    
    // MARK: ModuleViewModel
    func viewLoaded() {
        
    }
    
    
    //TODO: Uncomment on dataObject ready
//    var moduleType: ModuleConfigurationType<RoasterDataObject>?
}

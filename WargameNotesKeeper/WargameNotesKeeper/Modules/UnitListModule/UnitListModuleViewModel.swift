//
//  UnitListModuleViewModel.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 13/06/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation

class UnitListModuleViewModel: ModuleViewModel {
    
    var interactor: UnitListModuleInteractor!
    var database: DatabaseService!
    
    // MARK: ModuleViewModel
    var rowViewModels: [RowViewModel]?
    func updateRows() {
        buldRows()
    }
    
    
    //TODO: Uncomment on dataObject ready
//    var moduleType: ModuleConfigurationType<RoasterDataObject>?
}

//
//  UnitListModuleView.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 13/06/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit

class UnitListModuleView: ViewController {
    
    var viewModel: UnitListModuleViewModel! {
        didSet {
            viewModel.buldRows()
            subscribeOnChanges()
        }
    }
    
    func subscribeOnChanges() {
        
    }
}

//TODO: Uncomment on dataObject ready
//extension UnitListModuleView : ModuleConfigurable {
//    typealias T = RoasterDataObject
//
//    func configure(with type: ModuleConfigurationType<RoasterDataObject>) {
//
//        viewModel.moduleType = type
//    }
//
//}

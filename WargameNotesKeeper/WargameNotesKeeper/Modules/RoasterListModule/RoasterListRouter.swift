//
//  RoasterListRouter.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 12/09/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit

class RoasterListRouter: ModuleRouter {
    
    var settingsModuleFactory: Assembly!
    
    func openSettingsController() {
        
        let vc = settingsModuleFactory.produce { (vc) in
            return vc
        }
        currentViewController.navigationController?.pushViewController(vc, animated: true)
    }
}

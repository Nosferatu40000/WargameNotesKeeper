//
//  RootNavigationViewController.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 02/09/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit

class RootNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewControllers.count == 0 {
            
            let assembly = Assembly.roasterListModuleFactory()
            let vc = assembly.produce { (vc) in
                return vc
            }
            self.viewControllers = [vc]
        }
    }
}

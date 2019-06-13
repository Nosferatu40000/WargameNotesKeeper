//
//  Assembly.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 13/06/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit

class Assembly {
    
    var viewController : UIViewController!
    func produce(block: (UIViewController) -> UIViewController) -> UIViewController {
        
        return block(viewController)
    }
}

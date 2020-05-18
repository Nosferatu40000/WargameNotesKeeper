//
//  ModuleViewModel.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 13/06/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol ModuleViewModel {
    
    var moduleTitle: String { get set }
    var rightHeaderButtons: [UIBarButtonItem] { get set }
    var leftHeaderButtons: [UIBarButtonItem] { get set }
    var placeholder: UIImage? { get set }
    var dataObjects: [Object] { get set }
    
    func viewLoaded()
}

//
//  ModuleViewModel.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 13/06/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation

protocol ModuleViewModel {
    
    var rowViewModels: [RowViewModel]? { get set }
    func updateRows()
}

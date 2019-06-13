//
//  UnitListModuleViewModel+RowsBuilder.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 13/06/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation

extension UnitListModuleViewModel : RowsBuilder {
    
    func buldRows() {
        
        var rows: [RowViewModel] = []
        rows <<+< nil
        
        rowViewModels = rows
    }
}

//
//  TableViewCellProtocol.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 12/09/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation

protocol TableViewCell {
    
    func setRow(_ row: RowViewModel)
    func bindRowValues()
}

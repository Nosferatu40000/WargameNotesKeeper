//
//  String+Int.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 11/06/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation

extension String {
    
    var toInt: Int {
        
        let formatter = NumberFormatter()
        return formatter.number(from: self)?.intValue ?? 0
    }
    
    static func fromInt(_ int: Int) -> String {
        
        return "\(int)"
    }
}

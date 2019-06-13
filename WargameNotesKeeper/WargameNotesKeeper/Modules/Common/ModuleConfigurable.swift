//
//  ModuleConfigurable.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 13/06/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation

protocol ModuleConfigurable {
    
    associatedtype T
    func configure(with type: ModuleConfigurationType<T>)
}

enum ModuleConfigurationType<T> {
    
    case new
    case current(T)
}

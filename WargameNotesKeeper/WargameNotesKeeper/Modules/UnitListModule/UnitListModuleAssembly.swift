//
//  UnitListModuleAssembly.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 13/06/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import Swinject

extension Assembly {
    
    static func unitListModuleFactory() -> Assembly {
        
        let container = Container()
        
        container.register(UnitListModuleView.self) { assembly in
            
            let vc = UnitListModuleView()
            
            vc.viewModel = assembly.resolve(UnitListModuleViewModel.self)
            
            return vc
        }.inObjectScope(.weak)
        
        container.register(UnitListModuleViewModel.self) { assembly in
            
            let viewModel = UnitListModuleViewModel()
            
            viewModel.interactor = assembly.resolve(UnitListModuleInteractor.self)
            
            return viewModel
        }.inObjectScope(.weak)
        
        container.register(UnitListModuleInteractor.self) { assembly in
            
            let interactor = UnitListModuleInteractor()
            return interactor
        }.inObjectScope(.weak)
        
        container.register(Assembly.self) { a in
            
            let assembly = Assembly()
            assembly.viewController = a.resolve(UnitListModuleView.self)
            
            return assembly
        }.inObjectScope(.weak)
        
        return container.resolve(Assembly.self)!
    }
}

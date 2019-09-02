//
//  RoasterListAssembly.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 02/09/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import Swinject

extension Assembly {
    
    static func roasterListModuleFactory() -> Assembly {
        
        let container = Container()
        
        container.register(RoasterListViewController.self) { assembly in
            
            let vc = RoasterListViewController()
            
            vc.viewModel = assembly.resolve(RoasterListViewModel.self)
            
            return vc
            }.inObjectScope(.weak)
        
        container.register(RoasterListViewModel.self) { assembly in
            
            let viewModel = RoasterListViewModel()
            
            viewModel.interactor = assembly.resolve(RoasterListInteractor.self)
            viewModel.database = ServiceAssembly.databaseService()
            
            return viewModel
            }.inObjectScope(.weak)
        
        container.register(RoasterListInteractor.self) { assembly in
            
            let interactor = RoasterListInteractor()
            return interactor
            }.inObjectScope(.weak)
        
        container.register(Assembly.self) { a in
            
            let assembly = Assembly()
            assembly.viewController = a.resolve(RoasterListViewController.self)
            
            return assembly
            }.inObjectScope(.weak)
        
        return container.resolve(Assembly.self)!
    }
}

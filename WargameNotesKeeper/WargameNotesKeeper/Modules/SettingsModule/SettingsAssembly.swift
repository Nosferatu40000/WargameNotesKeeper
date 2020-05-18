//
//  SettingsAssembly.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 12/09/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import Swinject

extension Assembly {
    
    static func settingsModuleFactory() -> Assembly {
        
        let container = Container()
        
        container.register(SettingsView.self) { assembly in
            
            let vc = SettingsView()
            
            vc.viewModel = assembly.resolve(SettingsViewModel.self)
            
            return vc
            }.inObjectScope(.weak)
        
        container.register(SettingsViewModel.self) { assembly in
            
            let viewModel = SettingsViewModel()
            
            viewModel.interactor = assembly.resolve(SettingsInteractor.self)
            viewModel.router = assembly.resolve(SettingsRouter.self)
            viewModel.database = ServiceAssembly.databaseService()
            
            return viewModel
            }.inObjectScope(.weak)
        
        container.register(SettingsInteractor.self) { assembly in
            
            let interactor = SettingsInteractor()
            return interactor
            }.inObjectScope(.weak)
        
        container.register(SettingsRouter.self) { assembly in
            
            let router = SettingsRouter()
            return router
            }.inObjectScope(.weak)
        
        container.register(Assembly.self) { a in
            
            let assembly = Assembly()
            assembly.viewController = a.resolve(SettingsView.self)
            
            return assembly
            }.inObjectScope(.weak)
        
        return container.resolve(Assembly.self)!
    }
}

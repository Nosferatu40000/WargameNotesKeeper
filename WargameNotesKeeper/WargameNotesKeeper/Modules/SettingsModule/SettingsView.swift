//
//  SettingsView.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 12/09/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import Eureka

class SettingsView: ViewController {
    
    var viewModel: SettingsViewModel! {
        didSet {
            setViewModel(viewModel)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewAppeared()
    }
    
    override func reloadForm() {
        super.reloadForm()
        
        let section = Section()
        
        for gameSystem in viewModel.dataObjects {
            
            guard let system = gameSystem as? GameSystemDatabaseObject else {
                return
            }
            
            section <<< GameSystemRowViewModel {
                $0.title = system.name
                
                guard let data = system.imageData else {return}
                $0.value = UIImage(data: data)
            }
        }
        
        form +++ section
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectGameSystem(indexPath.row)
    }
}


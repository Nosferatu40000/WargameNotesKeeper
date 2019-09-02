//
//  RoasterListViewModel+RowsBuilder.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 03/09/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit

extension RoasterListViewModel : RowsBuilder {
    
    func buldRows() {
        
        rows = []
        
        for roaster in roasters {
            
            let view : PickerRowCell = Bundle.main.loadNibNamed(String(describing: PickerRowCell.self),
                                                                owner: nil,
                                                                options: nil)?.first as! PickerRowCell
            view.setCorner(8.0)
            view.roasterNameLabel.text = roaster.name
            view.gameSystemLabel.text = roaster.gameSystem?.name
            
            if let data = roaster.gameSystem?.imageData {
                
                view.backgroundImageView.image = UIImage(data: data)
            } else {
                
                view.backgroundImageView.image = UIImage(named: "placeholder")
            }
            
            rows <<+< view
        }
        
        rows <<+< addNewRow()
    }
    
    func addNewRow() -> UIView {
        
        let view = UIView(frame: .zero)
        
        view.backgroundColor = .red//UIColor.lightGray.withAlphaComponent(0.6)
        view.layer.cornerRadius = 8.0
        
        let imageView = UIImageView(frame: .zero)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        imageView.image = UIImage(named: "Add")
        
        return view
    }
}

//
//  PickerRowCell.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 02/09/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit

class PickerRowCell: UIView {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var roasterNameLabel: UILabel!
    @IBOutlet weak var gameSystemLabel: UILabel!
    
    private var deleteAction: (()-> Void)?
    
    func setCorner(_ corner: CGFloat) {
        
        backgroundImageView.layer.cornerRadius = corner
    }
    
    func setDeleteAction(_ deleteAction: @escaping (() -> Void)) {
        
        self.deleteAction = deleteAction
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        
        deleteAction?()
    }
}

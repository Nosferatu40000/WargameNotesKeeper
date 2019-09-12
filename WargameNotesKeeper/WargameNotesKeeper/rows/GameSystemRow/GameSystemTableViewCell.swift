//
//  GameSystemTableViewCell.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 12/09/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import Eureka
import RxSwift
import RxCocoa

final class GameSystemTableViewCell: Cell<UIImage>, CellType {
    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var systemImageView: UIImageView!
    @IBOutlet weak var systemTitle: UILabel!
    
    override func setup() {
        super.setup()
        
        selectionStyle = .none
        
        backGroundView.layer.cornerRadius = 8.0
        backGroundView.layer.shadowColor = UIColor.black.cgColor
        backGroundView.layer.shadowOpacity = 1.0
        backGroundView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        backGroundView.layer.shadowRadius = 5.0

    }
    
    override func update() {
        super .update()
        
        guard let viewModel = row as? GameSystemRowViewModel else {
            return
        }
        
        systemTitle.text = viewModel.title
        systemImageView.image = viewModel.value
    }
}

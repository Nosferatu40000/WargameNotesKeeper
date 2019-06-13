//
//  ViewController.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 14/06/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit
import Eureka

class ViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.form.delegate = self
    }
}

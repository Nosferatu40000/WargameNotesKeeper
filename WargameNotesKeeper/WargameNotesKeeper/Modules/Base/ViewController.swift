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
import RxSwift
import RxCocoa
import RealmSwift

class ViewController: FormViewController {
    
    func setViewModel(_ vm: ModuleViewModel) {
        privateViewModel = vm
    }
    private var privateViewModel: ModuleViewModel?
    private var placeholderImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
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
        privateViewModel?.viewLoaded()
        setPlaceholderIfNeeded()
        
        subscribeOnChanges()
    }
    
    func subscribeOnChanges() {
        
        guard let viewModel = privateViewModel else {
            return
        }
        
        BehaviorRelay<String>(value: viewModel.moduleTitle).asObservable().subscribe(onNext: { [weak self] (moduleTitle) in
            
            self?.title = moduleTitle
        }).disposed(by: DisposeBag())
        
        BehaviorRelay<[UIBarButtonItem]>(value: viewModel.leftHeaderButtons).asObservable().subscribe(onNext: { [weak self] (buttons) in
            
            if buttons.count > 0 {
                
                self?.navigationItem.leftBarButtonItems = buttons
            }
        }).disposed(by: DisposeBag())
        
        BehaviorRelay<[UIBarButtonItem]>(value: viewModel.rightHeaderButtons).asObservable().subscribe(onNext: { [weak self] (buttons) in
            
            if buttons.count > 0 {
                
                self?.navigationItem.rightBarButtonItems = buttons
            }
        }).disposed(by: DisposeBag())
        
        BehaviorRelay<[Object]>(value: viewModel.dataObjects).asObservable().subscribe(onNext: { [weak self] (objects) in
            
            self?.tableView.isHidden = (objects.count == 0)
            self?.placeholderImageView?.isHidden = (objects.count > 0)
            self?.reloadForm()
        }).disposed(by: DisposeBag())
    }
    
    func reloadForm() {
        form.removeAll()
    }
    
    func setPlaceholderIfNeeded() {
        
        if let image = privateViewModel?.placeholder {
            
            placeholderImageView = UIImageView(image: image)
            placeholderImageView?.contentMode = .scaleAspectFill
            placeholderImageView?.alpha = 0.7
            
            guard let imageView = placeholderImageView else {
                return;
            }
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageView)
            imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
    }
}

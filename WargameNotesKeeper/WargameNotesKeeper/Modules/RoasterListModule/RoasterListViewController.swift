//
//  RoasterListViewController.swift
//  WargameNotesKeeper
//
//  Created by Orlov Alex on 19/08/2019.
//  Copyright © 2019 Orlov Alex. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class RoasterListViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var viewModel: RoasterListViewModel! {
        didSet {
            subscribeOnChanges()
        }
    }
    
    private let picker = UIPickerView()
    
    override func viewDidLoad() {
        
        addPicker()
        viewModel.viewLoaded()
    }
    
    func subscribeOnChanges() {
        
        let myBehaviorRelay = BehaviorRelay<Bool>(value: true)
        myBehaviorRelay.accept(false)
        /*BehaviorRelay<[RoasterDatabaseObject]>(value:*/Variable( viewModel.roasters).asObservable().subscribe(onNext: { [weak self] (_) in
            
            self?.picker.reloadAllComponents()
        }).disposed(by: DisposeBag())
    }
    
    func addPicker() {
        
        picker.delegate = self
        picker.dataSource = self
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)
        
        picker.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        picker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        picker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        picker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        picker.transform = CGAffineTransform(rotationAngle: .pi/2)
    }
    
    //MARK: UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.roasters.count
    }
    
    //MARK: UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return UIView()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        viewModel.didSelectRoaster(row)
    }
}

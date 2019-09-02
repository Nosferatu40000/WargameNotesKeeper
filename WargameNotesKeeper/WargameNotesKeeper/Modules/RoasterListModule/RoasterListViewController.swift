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
        
        view.backgroundColor = .white
        addPicker()
        viewModel.viewLoaded()
    }
    
    func subscribeOnChanges() {
        
        let myBehaviorRelay = BehaviorRelay<Bool>(value: true)
        myBehaviorRelay.accept(false)
        BehaviorRelay<[RoasterDatabaseObject]>(value: viewModel.roasters).asObservable().subscribe(onNext: { [weak self] (_) in
            
            self?.viewModel.buldRows()
            self?.picker.reloadAllComponents()
        }).disposed(by: DisposeBag())
    }
    
    func addPicker() {
        
        picker.delegate = self
        picker.dataSource = self
        
        picker.backgroundColor = .clear
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)
        
        let hatView = navigationController?.navigationBar.frame.size.height ?? 0.0
        
        picker.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        picker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - hatView).isActive = true
        picker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        picker.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: hatView).isActive = true
        
        picker.transform = CGAffineTransform(rotationAngle: .pi/2)
    }
    
    //MARK: UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.rows.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerView.frame.width - 150.0
    }
    
    //MARK: UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let view = viewModel.rows[row]
        view.frame = CGRect(x: 0.0, y: 0.0, width: pickerView.frame.width - 150.0, height: pickerView.frame.height - 150.0)
        view.transform = CGAffineTransform(rotationAngle: -.pi/2)
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        viewModel.didSelectRoaster(row)
    }
}

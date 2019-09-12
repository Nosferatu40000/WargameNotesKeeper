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
        
        title = viewModel.moduleTitle
        navigationItem.rightBarButtonItems = viewModel.rightHeaderButtons
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.viewAppeared()
    }
    
    func subscribeOnChanges() {
        
        BehaviorRelay<[RoasterDatabaseObject]>(value: viewModel.roasters).asObservable().subscribe(onNext: { [weak self] (_) in
            
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
        return viewModel.roasters.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerView.frame.width - 150.0
    }
    
    //MARK: UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        if viewModel.roasters.count > row {
            return roasterRow(viewModel.roasters[row])
        }
        
        return addNewRoasterRow()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        viewModel.didSelectRoaster(row)
    }
    
    func addNewRoasterRow() -> UIView {
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: picker.frame.width - 150.0, height: picker.frame.height - 150.0))
        
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        view.layer.cornerRadius = 8.0
        
        let imageView = UIImageView(frame: .zero)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        imageView.image = UIImage(named: "Add")
        
        view.transform = CGAffineTransform(rotationAngle: -.pi/2)
        
        return view
    }
    
    func roasterRow(_ roaster: RoasterDatabaseObject) -> UIView {
        
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
        view.frame = CGRect(x: 0.0, y: 0.0, width: picker.frame.width - 150.0, height: picker.frame.height - 150.0)
        view.transform = CGAffineTransform(rotationAngle: -.pi/2)
        
        return view
    }
}

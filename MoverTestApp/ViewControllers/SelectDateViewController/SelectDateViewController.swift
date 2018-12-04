//
//  SelectDateViewController.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 03.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

class SelectDateViewController: UIViewController {
    
    @IBOutlet weak var monthsCollectionView: BaseCollectionView!
    @IBOutlet weak var hourPickerView: UIPickerView!
    @IBOutlet weak var minutesPickerView: UIPickerView!
    @IBOutlet weak var doneButton: UIButton!
    
    var viewModel: SelectDateViewControllerModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SelectDateViewControllerModel()
    }
    
    @IBAction func done(_ sender: UIButton) {
        
    }
}

extension SelectDateViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension SelectDateViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension SelectDateViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView === hourPickerView {
            return viewModel.hours.count
        } else if pickerView === minutesPickerView {
            return viewModel.minutes.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView === hourPickerView {
            return "\(viewModel.hours[row])"
        } else if pickerView === minutesPickerView {
            return "\(viewModel.minutes[row])"
        }
        
        return ""
    }
}

extension SelectDateViewController: UIPickerViewDelegate {
    
}

class SelectDateViewControllerModel {
    
    let hours: [Int] = (0...24).map { $0 }
    let minutes: [Int] = stride(from: 0, through: 60, by: 5).map { $0 }
    
}

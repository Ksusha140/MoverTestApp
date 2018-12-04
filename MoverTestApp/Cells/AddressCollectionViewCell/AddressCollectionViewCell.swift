//
//  AddressCollectionViewCell.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 03.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

class AddressCollectionViewCell: UICollectionViewCell, Cell {
    
    typealias CellViewModelType = AddressCollectionViewCellModel
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var routePointView: RoutePointView!
    
    var viewModel: AddressCollectionViewCellModel! {
        didSet {
            routePointView.viewModel = viewModel.routePointViewModel
            update()
        }
    }
}

extension AddressCollectionViewCell {
    func update() {
        updateAddress(newAddress: viewModel.address)
    }
    
    func updateAddress(newAddress: String) {
        addressLabel.text = newAddress
    }
}

class AddressCollectionViewCellModel: CellViewModel {
    
    let address: String
    let addressType: AddressType
    let routePointViewModel: RoutePointViewModel
    
    var cellClassName: String {
        return AddressCollectionViewCell.className
    }
    
    init(address: String, addressType: AddressType) {
        self.address = address
        self.addressType = addressType
        switch addressType {
        case .from:
            self.routePointViewModel = RoutePointViewModel(
                pointLetter: "A",
                pointColor: UIColor.Mover.orange
            )
        case .to:
            self.routePointViewModel = RoutePointViewModel(
                pointLetter: "B",
                pointColor: UIColor.Mover.coralRed
            )
        }
        
        self.routePointViewModel.toggleState()
    }
}

//
//  AddressDataSelectionCollectionViewCell.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 02.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

enum AddressType: String {
    case from = "Откуда?"
    case to = "Куда?"
}

class AddressDataSelectionCollectionViewCell: UICollectionViewCell, OrderDataSelectionCellProtocol {
    
    typealias CellViewModelType = AddressSelectionCollectionViewCellModel
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var routePointView: RoutePointView!
    
    var viewModel: AddressSelectionCollectionViewCellModel! {
        didSet {
            viewModel.delegate = self
            routePointView.viewModel = viewModel.routePointViewModel
            update()
        }
    }
}

class AddressSelectionCollectionViewCellModel: OrderDataSelectionCellModelProtocol {
    
    weak var delegate: OrderDataSelectionViewModelDelegate?
    
    let title: String
    let addressType: AddressType
    let routePointViewModel: RoutePointViewModel
    
    private(set) var state = OrderDataSelectionState.off {
        didSet {
            delegate?.stateWasUpdated()
        }
    }
    
    var cellClassName: String {
        return AddressDataSelectionCollectionViewCell.className
    }
    
    init(addressType: AddressType) {
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
        
        self.title = addressType.rawValue
    }
    
    func toggleState() {
        state.toggle()
        routePointViewModel.toggleState()
    }
}

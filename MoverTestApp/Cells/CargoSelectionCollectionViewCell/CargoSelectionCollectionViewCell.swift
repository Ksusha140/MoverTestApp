//
//  CargoSelectionCollectionViewCell.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 02.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

class CargoSelectionCollectionViewCell: UICollectionViewCell, OrderDataSelectionTintableImageCellProtocol {
    
    typealias CellViewModelType = CargoSelectionCollectionViewCellModel
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: CargoSelectionCollectionViewCellModel! {
        didSet {
            viewModel.delegate = self
            update()
        }
    }
}

class CargoSelectionCollectionViewCellModel: OrderDataSelectionCellModelProtocol {
    
    weak var delegate: OrderDataSelectionViewModelDelegate?
    
    let title: String = "Добавьте груз"
    private(set) var state = OrderDataSelectionState.off {
        didSet {
            delegate?.stateWasUpdated()
        }
    }
    
    var cellClassName: String {
        return CargoSelectionCollectionViewCell.className
    }
    
    func toggleState() {
        state.toggle()
    }
}

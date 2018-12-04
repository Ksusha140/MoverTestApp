//
//  PaymentDataSelectionCollectionViewCell.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 03.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

class PaymentDataSelectionCollectionViewCell: UICollectionViewCell, OrderDataSelectionCellProtocol {
    
    typealias CellViewModelType = PaymentDataSelectionCollectionViewCellModel
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: PaymentDataSelectionCollectionViewCellModel! {
        didSet {
            viewModel.delegate = self
            update()
        }
    }
}

class PaymentDataSelectionCollectionViewCellModel: OrderDataSelectionCellModelProtocol {
    
    weak var delegate: OrderDataSelectionViewModelDelegate?
    
    let title = "Способ оплаты"
    private(set) var state = OrderDataSelectionState.off {
        didSet {
            delegate?.stateWasUpdated()
        }
    }
    
    var cellClassName: String {
        return PaymentDataSelectionCollectionViewCell.className
    }
    
    func toggleState() {
        state.toggle()
    }
}

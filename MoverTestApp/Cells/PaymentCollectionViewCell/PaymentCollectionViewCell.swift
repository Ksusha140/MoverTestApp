//
//  PaymentCollectionViewCell.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 03.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

class PaymentCollectionViewCell: UICollectionViewCell, Cell {
    typealias CellViewModelType = PaymentCollectionViewCellModel
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var viewModel: PaymentCollectionViewCellModel! {
        didSet {
            update()
        }
    }
    
    override func awakeFromNib() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.Mover.orderCellBorderColor.cgColor
    }
}

extension PaymentCollectionViewCell {
    func update() {
        
    }
}

class PaymentCollectionViewCellModel: CellViewModel {
    
    let paymentType: PaymentType
    
    var cellClassName: String {
        return PaymentCollectionViewCell.className
    }
    
    init(paymentType: PaymentType) {
        self.paymentType = paymentType
    }
}

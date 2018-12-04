//
//  TimeDataSelectionCollectionViewCell.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 02.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

class TimeDataSelectionCollectionViewCell: UICollectionViewCell, OrderDataSelectionTintableImageCellProtocol {
    
    typealias CellViewModelType = TimeDataSelectionCollectionViewCellModel
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: TimeDataSelectionCollectionViewCellModel! {
        didSet {
            viewModel.delegate = self
            update()
        }
    }
}

class TimeDataSelectionCollectionViewCellModel: OrderDataSelectionCellModelProtocol {
    
    weak var delegate: OrderDataSelectionViewModelDelegate?
    
    let title: String = "Дата и время"
    private(set) var state = OrderDataSelectionState.off
    
    var cellClassName: String {
        return TimeDataSelectionCollectionViewCell.className
    }
    
    func toggleState() {
        state.toggle()
    }
}

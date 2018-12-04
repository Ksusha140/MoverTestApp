//
//  OrderDataSelectionTintableImageCellProtocol.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 02.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

protocol OrderDataSelectionTintableImageCellProtocol: OrderDataSelectionCellProtocol {
    var iconImageView: UIImageView! { get set }
}

extension OrderDataSelectionTintableImageCellProtocol {
    func update() {
        updateTitle(newTitle: viewModel.title)
        updateState(newState: viewModel.state)
        updateImage(for: viewModel.state)
    }
    
    func updateImage(for state: OrderDataSelectionState) {
        iconImageView.image = iconImageView.image?.withRenderingMode(.alwaysTemplate)
        
        switch state {
        case .off:
            iconImageView.tintColor = UIColor.Mover.mutedGray
        case .on:
            iconImageView.tintColor = UIColor.Mover.darkenBlue
        }
    }
}

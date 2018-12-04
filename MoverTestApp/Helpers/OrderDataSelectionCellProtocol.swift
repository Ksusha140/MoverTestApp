//
//  OrderDataSelectionCellProtocol.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 02.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

enum OrderDataSelectionState {
    case on
    case off
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

protocol OrderDataSelectionViewModelDelegate: class {
    func stateWasUpdated()
}

protocol OrderDataSelectionCellProtocol: OrderDataSelectionViewModelDelegate, Cell where CellViewModelType: OrderDataSelectionCellModelProtocol {
    var titleLabel: UILabel! { get set }
    
    func updateTitle(newTitle: String)
    func updateState(newState: OrderDataSelectionState)
}

protocol OrderDataSelectionCellModelProtocol: CellViewModel {
    var delegate: OrderDataSelectionViewModelDelegate? { get set }
    var title: String { get }
    var state: OrderDataSelectionState { get }
    
    func toggleState()
}

extension OrderDataSelectionCellProtocol where Self: UICollectionViewCell  {
    func update() {
        updateTitle(newTitle: viewModel.title)
    }
    
    func updateTitle(newTitle: String) {
        titleLabel.text = newTitle
    }
    
    func updateState(newState: OrderDataSelectionState) {
        switch newState {
        case .off:
            backgroundColor = UIColor.white
            layer.borderColor = UIColor.Mover.orderCellBorderColor.cgColor
            layer.borderWidth = 1
            titleLabel.textColor = UIColor.Mover.mutedGray
        case .on:
            backgroundColor = UIColor.Mover.darkenBlue.withAlphaComponent(0.07)
            layer.borderWidth = 0
            titleLabel.textColor = UIColor.Mover.darkenBlue
        }
    }
    
    func stateWasUpdated() {
        updateState(newState: viewModel.state)
    }
}

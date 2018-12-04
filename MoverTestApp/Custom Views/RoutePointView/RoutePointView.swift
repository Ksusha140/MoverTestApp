//
//  RoutePointView.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 02.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

protocol RoutePointViewModelDelegate: class {
    func stateWasChanged()
}

class RoutePointView: XibView {
    
    @IBOutlet weak var letterLabel: UILabel!
    
    var viewModel: RoutePointViewModel! {
        didSet {
            viewModel.delegate = self
            update()
        }
    }
    
    override func awakeFromNib() {
        layer.cornerRadius = self.bounds.width / 2
    }
}

private extension RoutePointView {
    func update() {
        updateLetter(newLetter: viewModel.pointLetter)
        updateState(newState: viewModel.state)
    }
    
    func updateLetter(newLetter: String) {
        letterLabel.text = newLetter
    }
    
    func updateState(newState: OrderDataSelectionState) {
        switch newState {
        case .on:
            backgroundColor = viewModel.pointColor
        case .off:
            backgroundColor = UIColor.Mover.mutedGray
        }
    }
}

extension RoutePointView: RoutePointViewModelDelegate {
    func stateWasChanged() {
        updateState(newState: viewModel.state)
    }
}

class RoutePointViewModel {
    
    weak var delegate: RoutePointViewModelDelegate?
    
    let pointLetter: String
    let pointColor: UIColor
    
    private(set) var state = OrderDataSelectionState.off {
        didSet {
            delegate?.stateWasChanged()
        }
    }
    
    init(pointLetter: String, pointColor: UIColor) {
        self.pointLetter = pointLetter
        self.pointColor = pointColor
    }
    
    func toggleState() {
        state.toggle()
    }
}

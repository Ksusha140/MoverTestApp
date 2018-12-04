//
//  CarSeatsCollectionViewCell.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 02.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

protocol CarSeatsViewModelDelegate: class {
    func carSeatsCountWasChanged()
}

class CarSeatsCollectionViewCell: UICollectionViewCell, Cell {
    
    typealias CellViewModelType = CarSeatsCollectionViewCellModel
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var seatsCountLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    
    var viewModel: CarSeatsCollectionViewCellModel! {
        didSet {
            viewModel.delegate = self
            update()
        }
    }
    
    override func awakeFromNib() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.Mover.orderCellBorderColor.cgColor
        minusButton.tag = -1
        plusButton.tag = 1
        minusButton.setTitleColor(UIColor.Mover.mutedGray, for: .disabled)
        plusButton.setTitleColor(UIColor.Mover.mutedGray, for: .disabled)
    }
    
    @IBAction func changeCarSeatsCount(_ sender: UIButton) {
        viewModel.changeCarSeats(by: sender.tag)
    }
}

extension CarSeatsCollectionViewCell {
    func update() {
        updateSeatsCount(newSeatsCount: viewModel.carSeatsCount)
        updateButtons(for: viewModel.carSeatsCount)
    }
    
    private func updateSeatsCount(newSeatsCount seatsCount: Int) {
        seatsCountLabel.text = "\(seatsCount)"
    }
    
    private func updateButtons(for carSeatsCount: Int) {
        minusButton.isEnabled = carSeatsCount != 0
        plusButton.isEnabled = carSeatsCount < 2
    }
}

extension CarSeatsCollectionViewCell: CarSeatsViewModelDelegate {
    func carSeatsCountWasChanged() {
        update()
    }
}

class CarSeatsCollectionViewCellModel: CellViewModel {
    
    weak var delegate: CarSeatsViewModelDelegate?
    
    var cellClassName: String {
        return CarSeatsCollectionViewCell.className
    }
    
    private(set) var carSeatsCount = 0 {
        didSet {
            delegate?.carSeatsCountWasChanged()
        }
    }
    
    fileprivate func changeCarSeats(by value: Int) {
        guard (0...2).contains(carSeatsCount + value) else {
            print("Error: carSeatsCount cannot be \(carSeatsCount + value)")
            return
        }
        
        carSeatsCount += value
    }
}

//
//  OrderTimeCollectionViewCell.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 02.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

protocol OrderTimeCollectionViewCellModelDelegate: class {
    func dateWasUpdated()
}

class OrderTimeCollectionViewCell: UICollectionViewCell, Cell {
    
    typealias CellViewModelType = OrderTimeCollectionViewCellModel
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var orderTimeLabel: UILabel!
    
    var viewModel: OrderTimeCollectionViewCellModel! {
        didSet {
            update()
        }
    }
    
    override func awakeFromNib() {
        iconImageView.image = iconImageView.image?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = UIColor.Mover.darkenBlue
    }
}

extension OrderTimeCollectionViewCell {
    func update() {
        updateDate(newDateString: viewModel.dateString)
        updateTime(newTimeString: viewModel.timeString)
    }
    
    private func updateDate(newDateString: String) {
        orderDateLabel.text = newDateString
    }
    
    private func updateTime(newTimeString: String) {
        orderTimeLabel.text = newTimeString
    }
}

extension OrderTimeCollectionViewCell: OrderTimeCollectionViewCellModelDelegate {
    func dateWasUpdated() {
        update()
    }
}

class OrderTimeCollectionViewCellModel: CellViewModel {
    
    weak var delegate: OrderTimeCollectionViewCellModelDelegate?
    
    private(set) var date: Date {
        didSet {
            delegate?.dateWasUpdated()
        }
    }
    
    var dateString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "mm"
            return ""
        }
    }
    
    var timeString: String {
        get {
            return ""
        }
    }
    
    var cellClassName: String {
        return OrderTimeCollectionViewCell.className
    }
    
    init(date: Date) {
        self.date = date
    }
    
    func updateDate(newDate: Date) {
        date = newDate
    }
}


//
//  CreateOrderViewController.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 02.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

class CreateOrderViewController: UIViewController {
    
    @IBOutlet weak var collectionView: BaseCollectionView!
    @IBOutlet weak var createOrderButton: UIButton!
    
    var viewModel: CreateOrderViewControllerModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CreateOrderViewControllerModel()
    }
}

extension CreateOrderViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = viewModel.cellViewModels[indexPath.item]
        let reuseIdentifier = cellViewModel.cellClassName
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.layer.cornerRadius = 10
        (cell as! AnyCell).setViewModel(cellViewModel)
        
        return cell
    }
}

extension CreateOrderViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension CreateOrderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        
        let cellType = viewModel.cellTypes[indexPath.item]
        let cellHeight: CGFloat = 60
        switch cellType {
        case .paymentSelection, .paymentData, .carSeats:
            let cellWidth: CGFloat = (collectionView.bounds.width - flowLayout.minimumInteritemSpacing) / 2
            return CGSize(width: cellWidth, height: cellHeight)
        default:
            return CGSize(width: collectionView.bounds.width, height: cellHeight)
        }
    }
}

class CreateOrderViewControllerModel {
    enum CellType {
        case timeSelection
        case addressSelection(type: AddressType)
        case cargoSelection
        case paymentSelection
        case timeData
        case addressData(type: AddressType)
//        case addressMap
//        case cargoData
//        case carData
        case carSeats
        case paymentData
    }
    
    var order = Order()
    
    var cellTypes: [CellType] = [.timeSelection, .addressData(type: .from), .addressData(type: .to), .cargoSelection, .carSeats, .paymentData]
    lazy var cellViewModels = self.createCellViewModels(from: self.cellTypes)
    
    private func createCellViewModels(from cellTypes: [CellType]) -> [CellViewModel] {
        order.fromAddress = "3-я Линия Хорошовского Серебрянного Бора, 15с3, Москва, Россия"
        order.toAddress = "Ленинский просп., 53а"
        order.paymentType = PaymentType.card(card: PaymentCard(number: "11115679", owner: "Test Test"))
        return cellTypes.map { cellType in
            switch cellType {
            case .timeSelection:
                let timeSelectionModel = TimeDataSelectionCollectionViewCellModel()
                timeSelectionModel.toggleState()
                return timeSelectionModel
            case .addressSelection(let type):
                return AddressSelectionCollectionViewCellModel(addressType: type)
            case .cargoSelection:
                return CargoSelectionCollectionViewCellModel()
            case .paymentSelection:
                return PaymentDataSelectionCollectionViewCellModel()
            case .timeData:
                return OrderTimeCollectionViewCellModel(date: order.date!)
            case .addressData(let type):
                let address = type == .to ? order.toAddress! : order.fromAddress!
                return AddressCollectionViewCellModel(address: address, addressType: type)
//            case .addressMap:
//                break
//            case .cargoData:
//                break
//            case .carData:
//                break
            case .carSeats:
                return CarSeatsCollectionViewCellModel()
            case .paymentData:
                return PaymentCollectionViewCellModel(paymentType: order.paymentType!)
            }
        }
    }
}


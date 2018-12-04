//
//  CellProtocol.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 02.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

protocol AnyCell: class {
    var anyCellViewModelType: CellViewModel.Type { get }
    func setViewModel(_ cellViewModel: CellViewModel)
}

protocol Cell: AnyCell {
    associatedtype CellViewModelType: CellViewModel
    static var className: String { get }
    
    var viewModel: CellViewModelType! { get set }
    
    func update()
}

extension Cell {
    var anyCellViewModelType: CellViewModel.Type {
        return CellViewModelType.self
    }
    
    static var className: String {
        return String(String(describing: self).split(separator: ".").last!)
    }
    
    func setViewModel(_ cellViewModel: CellViewModel) {
        guard let viewModel = cellViewModel as? CellViewModelType else { return }
        
        self.viewModel = viewModel
    }
}

protocol CellViewModel {
    var cellClassName: String { get }
}

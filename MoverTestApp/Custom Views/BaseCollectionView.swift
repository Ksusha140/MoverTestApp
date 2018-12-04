//
//  BaseCollectionView.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 03.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView {
    override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        return super.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
}

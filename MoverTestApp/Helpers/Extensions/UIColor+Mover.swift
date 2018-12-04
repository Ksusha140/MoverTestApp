//
//  UIColor+Mover.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 02.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import UIKit

extension UIColor {
    enum Mover {
        static var orderCellBorderColor: UIColor {
            get { return UIColor(red: 223/255, green: 230/255, blue: 244/255, alpha: 1) }
        }
        
        static var darkenBlue: UIColor {
            get { return UIColor(red: 65/255, green: 116/255, blue: 214/255, alpha: 1) }
        }
        
        static var mutedGray: UIColor {
            get { return UIColor(red: 50/255, green: 60/255, blue: 93/255, alpha: 0.3)}
        }
        
        static var orange: UIColor {
            get { return UIColor(red: 252/255, green: 146/255, blue: 31/255, alpha: 1)}
        }
        
        static var coralRed: UIColor {
            get { return UIColor(red: 251/255, green: 92/255, blue: 63/255, alpha: 1)}
        }
    }
}

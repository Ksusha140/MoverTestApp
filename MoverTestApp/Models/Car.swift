//
//  Car.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 03.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import Foundation

struct Car {
    enum CarType: Int {
        case van
        case tent
        case fullmetal
    }
    
    let size: Int
    let maxWeight: Double
    let seats: Int
    let possibleTypes: [CarType]
}

//extension Car: Codable {
//    enum CarCodingKeys: String, CodingKey {
//        case size
//        case weight
//        case seats
//        case types
//    }
//    
//    init(from decoder: Decoder) throws {
//        
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        
//    }
//}

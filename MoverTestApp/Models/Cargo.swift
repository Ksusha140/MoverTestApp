//
//  Cargo.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 03.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import Foundation

struct Cargo {
    struct Position {
        let name: String
        let weight: Double
    }
    
    let positions: [Position]
}

//extension Cargo: Codable {
//    enum CargoCodingKeys: String, CodingKey {
//        case positions
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

//extension Cargo.Position: Codable {
//    enum PositionCodingKeys: String, CodingKey {
//        case name
//        case weight
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

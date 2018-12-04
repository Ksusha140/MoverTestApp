//
//  Order.swift
//  MoverTestApp
//
//  Created by Ксения Афанасьева on 03.12.2018.
//  Copyright © 2018 Ксения Афанасьева. All rights reserved.
//

import Foundation

enum PaymentType {
    case money
    case applePay
    case card(card: PaymentCard)
    case bankAccount
}

struct Order {
    var fromAddress: String?
    var toAddress: String?
    var date: Date?
    var cargo: Cargo?
    var car: Car?
    var paymentType: PaymentType?
    
    init() { }
}

extension Order: Codable {
    enum OrderCodingKeys: String, CodingKey {
        case fromAddress = "address_from"
        case toAddress = "address_to"
        case date
        case car
    }
    
    init(from decoder: Decoder) throws {
        
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

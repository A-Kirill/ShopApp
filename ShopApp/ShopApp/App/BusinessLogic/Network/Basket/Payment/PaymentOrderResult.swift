//
//  PaymentOrderResult.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 04.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation

struct PaymentOrderResult: Codable {
    let result: Int
    let userMessage: String
}

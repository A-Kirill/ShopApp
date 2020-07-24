//
//  ProductDataResult.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 24.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation

struct ProductDataResult: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }    
}

//
//  BasketRequestResult.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 17.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation

struct BasketRequestResult: Codable {
    let amount, countGoods: Int
    let contents: [InBasket]
}

struct InBasket: Codable {
    let idProduct: Int
    let productName: String
    let price, quantity: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price, quantity
    }
}

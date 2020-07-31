//
//  ReviewsListResult.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 31.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation

struct ReviewsListResult: Codable {
    let result: Int
    let reviews: [Review]
        
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case reviews = "reviews"
    }
}

struct Review: Codable {
    let idProduct: Int
    let idUser: Int
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case idUser = "idUser"
        case text = "text"
    }    
}

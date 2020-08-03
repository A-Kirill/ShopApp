//
//  AddReviewResult.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 31.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation

struct AddReviewResult: Codable {
    let result: Int
    let message: String
        
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case message = "userMessage"
    }
}

//
//  LoginResult.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 20.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
}

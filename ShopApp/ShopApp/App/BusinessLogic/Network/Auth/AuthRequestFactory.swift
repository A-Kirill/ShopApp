//
//  AuthRequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 20.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

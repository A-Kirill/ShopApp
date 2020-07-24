//
//  ProfileChangeRequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 21.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

protocol ProfileChangeRequestFactory {
    func profileChange(idUser: Int,
                       userName: String,
                       password: String,
                       email: String,
                       gender: String,
                       creditCard: String,
                       bio: String,
                       completionHandler: @escaping (AFDataResponse<ProfileChangeResult>) -> Void)
}

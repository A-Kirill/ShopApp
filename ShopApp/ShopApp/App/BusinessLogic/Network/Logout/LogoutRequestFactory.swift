//
//  LogoutRequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 21.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {
    func logout(idUser: Int,
                completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}

//
//  BasketRequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 17.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    func getBasket(idUser: Int,
                   completionHandler: @escaping (AFDataResponse<BasketRequestResult>) -> Void)
}

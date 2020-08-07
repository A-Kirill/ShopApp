//
//  DeleteFromBasketRequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 03.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

protocol DeleteFromBasketRequestFactory {
    func deleteFromBasket(idProduct: Int,
                          completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void)
}

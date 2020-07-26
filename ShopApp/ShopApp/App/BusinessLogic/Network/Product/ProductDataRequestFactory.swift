//
//  ProductDataRequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 24.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

protocol ProductDataRequestFactory {
    func getProductData(id: Int,
                        completionHandler: @escaping (AFDataResponse<ProductDataResult>) -> Void)
}

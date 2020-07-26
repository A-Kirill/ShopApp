//
//  CatalogDataRequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 24.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

protocol CatalogDataRequestFactory {
    func getCatalogData(pageNumber: Int,
                        idCategory: Int,
                        completionHandler: @escaping (AFDataResponse<[Product]>) -> Void)
}

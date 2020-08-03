//
//  ReviewsListRequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 31.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

protocol ReviewsListRequestFactory {
    func getReviewsList(idProduct: Int,
                        completionHandler: @escaping (AFDataResponse<[Review]>) -> Void)
}

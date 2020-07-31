//
//  AddReviewRequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 31.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(idUser: Int,
                   idProduct: Int,
                   text: String,
                   completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
}

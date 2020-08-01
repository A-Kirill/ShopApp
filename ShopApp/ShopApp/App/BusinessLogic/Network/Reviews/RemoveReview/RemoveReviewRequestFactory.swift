//
//  RemoveReviewRequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 31.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

protocol RemoveReviewRequestFactory {
    func removeReview(id: Int,
                      completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void)
}

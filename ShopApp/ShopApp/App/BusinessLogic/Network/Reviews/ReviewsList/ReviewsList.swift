//
//  ReviewsList.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 31.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

class ReviewsList: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "http://127.0.0.1:8080/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ReviewsList: ReviewsListRequestFactory {
    func getReviewsList(idProduct: Int, completionHandler: @escaping (AFDataResponse<ReviewsListResult>) -> Void) {
        let requestModel = ReviewsList(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ReviewsList {
    struct ReviewsList: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getReviewsList"
        
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
}

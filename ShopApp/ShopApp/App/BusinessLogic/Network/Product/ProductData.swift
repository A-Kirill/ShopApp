//
//  ProductData.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 24.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

class ProductData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ProductData: ProductDataRequestFactory {
    func getProductData(id: Int, completionHandler: @escaping (AFDataResponse<ProductDataResult>) -> Void) {
        let requestModel = ProductData(baseUrl: baseUrl, idProduct: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductData {
    struct ProductData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
}

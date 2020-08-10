//
//  ProductData.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 24.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

// Класс запроса информации о товаре
class ProductData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "http://127.0.0.1:8080/")!
//    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: - реализация метода запроса информации о товаре
extension ProductData: ProductDataRequestFactory {
    func getProductData(id: Int, completionHandler: @escaping (AFDataResponse<ProductDataResult>) -> Void) {
        let requestModel = ProductData(baseUrl: baseUrl, idProduct: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: - структура параметров запроса
extension ProductData {
    struct ProductData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById"
        
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
}

//
//  DeleteFromBasket.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 03.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

// Класс запроса на удаление товара из корзины
class DeleteFromBasket: AbstractRequestFactory {
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

// MARK: - реализация метода на удаление товара из корзины
extension DeleteFromBasket: DeleteFromBasketRequestFactory {
    func deleteFromBasket(idProduct: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void) {
        let requestModel = DeleteFromBasket(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: - структура параметров запроса
extension DeleteFromBasket {
    struct DeleteFromBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket"
        
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
            ]
        }
    }
}

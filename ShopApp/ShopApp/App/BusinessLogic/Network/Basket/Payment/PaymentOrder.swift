//
//  PaymentOrder.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 04.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

// Класс запроса на оплату товара
class PaymentOrder: AbstractRequestFactory {
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

// MARK: - реализация метода оплаты товара
extension PaymentOrder: PaymentOrderRequestFactory {
    func paymentOrder(idProduct: Int, creditCard: String, completionHandler: @escaping (AFDataResponse<PaymentOrderResult>) -> Void) {
        let requestModel = PaymentOrder(baseUrl: baseUrl, idProduct: idProduct, creditCard: creditCard)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: - структура параметров запроса
extension PaymentOrder {
    struct PaymentOrder: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "payment"
        
        let idProduct: Int
        let creditCard: String
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
                "credit_card": creditCard,
            ]
        }
    }
}

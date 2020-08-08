//
//  AddReview.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 31.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

// Класс запроса на добавление ревью
class AddReview: AbstractRequestFactory {
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

// MARK: - реализация метода доавбления ревью
extension AddReview: AddReviewRequestFactory {
    func addReview(idUser: Int, idProduct: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, idUser: idUser, idProduct: idProduct, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: - структура параметров запроса
extension AddReview {
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addReview"
        
        let idUser: Int
        let idProduct: Int
        let text: String
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "id_product": idProduct,
                "text": text
            ]
        }
    }
}

//
//  PaymentOrderRequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 04.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

protocol PaymentOrderRequestFactory {
    func paymentOrder(idProduct: Int,
                      creditCard: String,
                      completionHandler: @escaping (AFDataResponse<PaymentOrderResult>) -> Void)
}

//
//  RequestFactory.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 20.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogoutRequestFatory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeProfileChangeRequestFatory() -> ProfileChangeRequestFactory {
        let errorParser = makeErrorParser()
        return ProfileChange(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeSignUpRequestFactory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeCatalogDataRequestFatory() -> CatalogDataRequestFactory {
        let errorParser = makeErrorParser()
        return CatalogData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}


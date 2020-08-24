//
//  AppDelegate.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 17.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        tryLogin()
//        sleep(2)
//        tryLogout()
//        sleep(2)
//        tryChangeData()
//        sleep(2)
//        trySignUp()
//        sleep(2)
//        tryRequestCatalogData()
//        sleep(2)
//        tryRequestProductData()
//        sleep(2)
//        tryAddReview()
//        sleep(2)
//        tryRemoveReview()
//        sleep(2)
//        tryGetReviews()
//        sleep(2)
//        tryAddToBasket()
//        sleep(2)
//        tryDeleteFromBasket()
//        sleep(2)
//        tryPayment()
//        tryGetBasket()
        
        FirebaseApp.configure()
        
        return true
    }

    // MARK: Actions
    
    private func tryLogin(){
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryLogout(){
        let logout = requestFactory.makeLogoutRequestFatory()
        logout.logout(idUser: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryChangeData(){
        let change = requestFactory.makeProfileChangeRequestFatory()
        change.profileChange(idUser: 123, userName: "Kirill", password: "geekbrains", email: "corp@gmail.com", gender: "m", creditCard: "1111-2222-3333-4444", bio: "Hi everyone!!!") { response in
            switch response.result {
            case .success(let profile):
                print(profile)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func trySignUp(){
        let signUp = requestFactory.makeSignUpRequestFactory()
        signUp.signUp(idUser: 222, userName: "Kirill", password: "newPass20!", email: "corp2@mail.ru", gender: "m", creditCard: "4444-4444-4444-4444", bio: "Here I am, Roch you like a hurricane") { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryRequestCatalogData(){
        let catalogData = requestFactory.makeCatalogDataRequestFatory()
        catalogData.getCatalogData(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryRequestProductData(){
        let productData = requestFactory.makeProductDataRequestFatory()
        productData.getProductData(id: 123) { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryAddReview(){
        let review = requestFactory.makeAddReviewRequestFatory()
        review.addReview(idUser: 222, idProduct: 123, text: "Amazing device...") { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryRemoveReview(){
        let review = requestFactory.makeRemoveReviewRequestFatory()
        review.removeReview(id: 222) { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryGetReviews(){
        let reviews = requestFactory.makeReviewsListRequestFatory()
        reviews.getReviewsList(idProduct: 123) { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryAddToBasket(){
        let adding = requestFactory.makeAddToBasketRequestFatory()
        adding.addToBasket(idProduct: 123, quantity: 1) { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryDeleteFromBasket(){
        let deleting = requestFactory.makeDeleteFromBasketRequestFatory()
        deleting.deleteFromBasket(idProduct: 123) { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryPayment(){
        let payment = requestFactory.makePaymentOrderRequestFatory()
        payment.paymentOrder(idProduct: 123, creditCard: "4444-4444-4444-4444") { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryGetBasket() {
        let basket = requestFactory.makeBasketRequestFactory()
        basket.getBasket(idUser: 222) { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


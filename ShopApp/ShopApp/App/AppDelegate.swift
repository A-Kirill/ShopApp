//
//  AppDelegate.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 17.07.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        tryLogin()
        sleep(2)
        tryLogout()
        
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


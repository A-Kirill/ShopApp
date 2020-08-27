//
//  MainViewController.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 17.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    
    @IBOutlet weak var showCatalog: UIButton!
    @IBOutlet weak var myBasket: UIButton!
    @IBOutlet weak var editProfile: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logOut = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(tryLogout))
        self.navigationItem.leftBarButtonItem = logOut

        showCatalog.layer.cornerRadius = 30
        myBasket.layer.cornerRadius = 30
        editProfile.layer.cornerRadius = 30
    }

    @objc func tryLogout() {
        self.navigationController?.popViewController(animated: true)
        
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
}

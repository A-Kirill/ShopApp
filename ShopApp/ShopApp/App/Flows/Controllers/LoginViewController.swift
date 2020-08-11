//
//  LoginViewController.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 07.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let requestFactory = RequestFactory()

    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func loginButton(_ sender: Any) {
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login.isEmpty || password.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Email and password must be filled.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: login, password: password) { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func signupButton(_ sender: Any) {
    }
    
    @IBAction func getCatalogPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
}

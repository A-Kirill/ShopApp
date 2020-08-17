//
//  LoginViewController.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 07.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, ActivityIndicatorPresenter {
    
    let requestFactory = RequestFactory()
    var activityIndicator = UIActivityIndicatorView()

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
        
        showActivityIndicator()
        
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: login, password: password) { response in
            switch response.result {
            case .success(let login):
                print(login)
                DispatchQueue.main.async {
                    self.openMainView()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.hideActivityIndicator()
        }
    }
    
    @IBAction func signupButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func openMainView() {
        if let mainController = storyboard?.instantiateViewController(identifier: "MainVC") as? MainViewController {
            navigationController?.pushViewController(mainController, animated: true)
        }
    }
}

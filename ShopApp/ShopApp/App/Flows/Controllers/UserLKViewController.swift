//
//  UserLKViewController.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 08.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class UserLKViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var passInput: UITextField!
    @IBOutlet weak var repeatPassInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var genderInput: UITextField!
    @IBOutlet weak var creditInput: UITextField!
    @IBOutlet weak var bioInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func registerPressed(_ sender: Any) {
        
        Analytics.logEvent("Save_tapped", parameters: ["Request": "profileChange"])
        
        let name = nameInput.text!
        let password = passInput.text!
        let repeatPass = repeatPassInput.text!
        let email = emailInput.text!
        let gender = genderInput.text!
        let credit = creditInput.text!
        let bio = bioInput.text!
        
        if name.isEmpty || password.isEmpty || repeatPass.isEmpty || email.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Required fields are not filled.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if  password != repeatPass {
            let alert = UIAlertController(title: "Alert", message: "Password mismatch", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let change = requestFactory.makeProfileChangeRequestFatory()
        change.profileChange(idUser: 222, userName: name, password: password, email: email, gender: gender, creditCard: credit, bio: bio) { response in
            switch response.result {
            case .success(let profile):
                print(profile)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Your info"
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Keyboard
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}

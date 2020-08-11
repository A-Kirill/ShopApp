//
//  ActivityIndicatorPresenter.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 11.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit

protocol ActivityIndicatorPresenter {
    
    var activityIndicator: UIActivityIndicatorView { get }
    
    func showActivityIndicator()
    func hideActivityIndicator()
}

extension ActivityIndicatorPresenter where Self: UIViewController {
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.style = .large
            self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            self.activityIndicator.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.height / 2)
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
        }
    }
}

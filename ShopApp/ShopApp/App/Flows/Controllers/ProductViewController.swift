//
//  ProductViewController.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 14.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class ProductViewController: UIViewController {
    
    var productId: Int = 0
    let requestFactory = RequestFactory()
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addBasketButton: UIButton!
    @IBOutlet weak var reviewsButton: UIButton!
    
    @IBAction func addBasketPressed(_ sender: Any) {
        tryAddToBasket()
    }
    @IBAction func reviewsPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tryRequestProductData()
        
        addBasketButton.layer.cornerRadius = 30
        reviewsButton.layer.cornerRadius = 30
    }

    // MARK: - Private functions
    
    private func tryRequestProductData() {
        
        Analytics.logEvent("Get_product_info", parameters: nil)
        
        let productData = requestFactory.makeProductDataRequestFatory()
        productData.getProductData(id: productId) { response in
            switch response.result {
            case .success(let value):
                DispatchQueue.main.async {
                    self.priceLabel.text = "Price: \(value.price) RUB"
                    self.descriptionLabel.text = value.description
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func tryAddToBasket() {
        
        Analytics.logEvent("Add_to_basket", parameters: nil)
        
        let adding = requestFactory.makeAddToBasketRequestFatory()
        adding.addToBasket(idProduct: productId, quantity: 1) { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
                DispatchQueue.main.async {
                    self.showDoneAllert()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func showDoneAllert() {
        let alert = UIAlertController(title: "Done", message: "Added to cart", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
